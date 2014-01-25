class CreateAttendings < ActiveRecord::Migration
  def change
    create_table :attendings do |t|

    	t.integer :user_id
    	t.integer :event_id

      t.timestamps

    end
          add_index :attendings, :user_id
      add_index :attendings, :event_id
      add_index :attendings, [:user_id, :event_id], unique: true
  end
end
