class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :department_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
