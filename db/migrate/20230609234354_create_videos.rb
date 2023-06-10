class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.text :transcript
      t.text :summary
      t.text :actions

      t.timestamps
    end
  end
end
