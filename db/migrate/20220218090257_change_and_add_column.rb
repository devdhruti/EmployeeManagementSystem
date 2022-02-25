class ChangeAndAddColumn < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :employees, :employee_name, :employee_first_name
    add_column :employees, :employee_last_name, :string
  end

  def self.down
    rename_column :employees, :employee_first_name, :employee_name
    remove_column :employees, :employee_last_name, :string
  end
end
