class AddEmailConfirmColumnToLeaves < ActiveRecord::Migration[6.0]
  def change
    add_column :leaves, :email_confirmed, :boolean, :default => false
    add_column :leaves, :confirm_token, :string
  end
end
