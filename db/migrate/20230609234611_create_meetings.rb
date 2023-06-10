class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.string :title
      t.text :description
      t.string :location
      t.text :objectives
      t.text :agenda
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
  end
end
