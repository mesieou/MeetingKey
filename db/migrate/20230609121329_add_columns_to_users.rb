class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :avatar, :string
    add_column :users, :job_title, :string
    add_column :users, :mobile, :string
  end
end
