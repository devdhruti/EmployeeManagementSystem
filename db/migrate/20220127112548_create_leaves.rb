class CreateLeaves < ActiveRecord::Migration[6.0]
  def change
    create_table :leaves do |t|
      t.date :start_date
      t.date :end_date
      t.string :leave_note
      t.string :notify_employee
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
