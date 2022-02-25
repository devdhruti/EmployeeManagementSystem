class HomesController < ApplicationController
  after_action :add_roles, only: [:index]

  def index
    @employees = Employee.all
    @departments = Department.all
    #@leave = Leave.where(start_date: Date.today).or(Leave.where(end_date: Date.today))
    @leave = Leave.all

    @leave_on_today = []
    @leave.each do |leave|
      @date = leave.start_date..leave.end_date
      @date = @date.to_a
      @date.each do |date|
        if date == Date.today
          @leave_on_today << leave
        end
      end
    end
  end

  def add_roles
    if current_user.present?
      # @email = current_user.email
      # employee = Employee.find_by(employee_email: @email)
      if current_user.email == "admin@example.com"
        current_user.add_role :admin
      end
    end
  end
end
