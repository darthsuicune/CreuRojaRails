class CreateLocationsUsers < ActiveRecord::Migration
	def change
		create_table :locations_users, id: false do |t|
			t.belongs_to :location_id
			t.belongs_to :user_id
		end
		add_index :locations_users, [:location_id, :user_id]
	end
end
