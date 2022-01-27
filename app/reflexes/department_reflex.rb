class DepartmentReflex < ApplicationReflex
  def create
    @department = Department.create(department_params)
  end

  def search(query = "")
    @searched_departments = Department.search(query)
    @searched_departments = Department.all.order(:created_at) if query == ""
  end

  def employee_search(query = "")
    searched_departments = Department.search(query)
    @employees = nil unless searched_departments.present?
    @employees = searched_departments.first.employees if searched_departments.present?
  end

  private
  def department_params
    params.require(:department).permit(:user_id, :department_name, :query)
  end
end
