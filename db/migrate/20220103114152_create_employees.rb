class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :employee_name
      t.integer :employee_number
      t.string :employee_email
      t.string :job_title
      t.integer :mobile_number
      t.date :date_of_joining
      t.decimal :employee_salary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
