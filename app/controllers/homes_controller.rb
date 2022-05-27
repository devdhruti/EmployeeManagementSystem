class HomesController < ApplicationController
  def index
    @employees = Employee.all
    @count = @employees.size
  end
end
