class EmployeeReflex < ApplicationReflex
  def search(query = "")
    @searched_employees = Employee.search(query)
    @searched_employees = Employee.all.order(:created_at) if query == ""
  end

  def show
    @show_employee = Employee.find(element.dataset[:employee_id])
  end
end
