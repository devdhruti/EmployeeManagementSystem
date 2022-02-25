ActiveAdmin.register Employee do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :employee_first_name, :employee_number, :employee_email, :job_title, :mobile_number, :date_of_joining, :employee_salary, :user_id, :department_id, :employee_last_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:employee_first_name, :employee_number, :employee_email, :job_title, :mobile_number, :date_of_joining, :employee_salary, :user_id, :department_id, :employee_last_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
