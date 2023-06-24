class UpdateMeetingColumns < ActiveRecord::Migration[6.1]
  def change
    change_column :meetings, :objectives, :text, array: true, default: [], using: "(string_to_array(objectives, ','))"
    change_column :meetings, :agenda, :text, array: true, default: [], using: "(string_to_array(agenda, ','))"
  end
end
