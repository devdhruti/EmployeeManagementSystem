class EmployeesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @employees = Employee.order(:created_at)
  end

  def new
    @employee = Employee.new
    @errors = @employee.errors.full_messages
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path
    else
      render :new, :locals => @employee.errors
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render :edit, :locals => @employee.errors
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  private
  def employee_params
    params.require(:employee).permit(:user_id, :employee_name, :employee_number, :employee_email, :job_title, :mobile_number, :employee_salary, :date_of_joining, :query)
  end
end
