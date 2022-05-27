class LeavesController < ApplicationController
  before_action :authenticate_user!
  before_action :add_roles, only: [:new, :index]

  def add_roles
    @email = current_user.email
    employee = Employee.find_by(employee_email: @email)
    if employee.present?
      current_user.add_role :employee
    end
  end

  def index
    @leaves = Leave.order(:created_at)
    employee = Employee.find_by(employee_email: current_user.email)
    @current_user_leaves = employee.leaves if employee.present?
  end

  def new
    @leave = Leave.new
    unless current_user.has_role? :admin
      @employee = Employee.find_by(employee_email: current_user.email)
    end
  end

  def create
    @leave = Leave.new(leave_params)
    @employee = Employee.find_by_id(@leave.employee_id)

    if @leave.save
      @employee = Employee.find_by_id(@leave.employee_id)
      SendMailWorker.new.perform(@leave.notify_employee, @employee.employee_first_name, @leave)
      redirect_to leaves_path 
    else
      render :new, :locals => @leave.errors
    end
  end

  def confirm_email
    leave = Leave.find_by_confirm_token(params[:id])
    if leave
      leave.email_activate
      #flash[:success] = "Your leave has been confirmed"
      redirect_to leaves_path
    else
      #flash[:error] = "Sorry. Your leave is not confirmed"
      redirect_to leaves_path
    end
end

  private
  def leave_params
    params.require(:leave).permit(:employee_id, :start_date, :end_date, :leave_type, :leave_note, :notify_employee)
  end
end
