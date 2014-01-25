class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

    t.string :title
    t.string :location
    t.integer :points
    t.string :description
    t.timestamp :start_time
 	t.timestamp :end_time	

    t.timestamps
    end
  end
end
