class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
    	t.integer :user_id
    	t.integer :age
    	t.string :school
    	t.string :power

      t.timestamps
    end
  end
end
