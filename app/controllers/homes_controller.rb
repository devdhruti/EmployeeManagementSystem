class HomesController < ApplicationController
  def index
    @employees = Employee.all
    @departments = Department.all
  end
end
