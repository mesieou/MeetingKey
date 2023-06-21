class AddUserToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_reference :meetings, :user, null: true, foreign_key: true
  end
end
