class ChangeVideoIdNullableInMeetings < ActiveRecord::Migration[7.0]
  def change
    change_column_null :meetings, :video_id, true
  end
end
