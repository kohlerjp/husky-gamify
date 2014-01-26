class AddUserInformation < ActiveRecord::Migration
  def change
  	remove_column :user_profiles,:aboutme 
  	remove_column :user_profiles,:age
  	add_column :user_profiles, :yog, :integer
  	add_column :user_profiles,:favsport, :string
  end
end
