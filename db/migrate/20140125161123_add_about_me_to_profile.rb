class AddAboutMeToProfile < ActiveRecord::Migration
  def change
  	add_column :user_profiles, :aboutme, :string
  end
end
