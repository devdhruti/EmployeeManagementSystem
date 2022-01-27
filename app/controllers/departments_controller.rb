class DepartmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @departments = current_user.departments.order(:created_at)
    @department = Department.new
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to departments_path
  end

  def employees
    @departments = Department.order(:created_at)
  end

  def show
    @department = Department.find(params[:id])
    @employees = @department.employees
  end
end
