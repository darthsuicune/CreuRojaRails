class CreateUserVehicles < ActiveRecord::Migration
	def change
		create_table :user_vehicles do |t|
			t.integer :user_id
			t.integer :service_id
			t.integer :vehicle_id
			t.string :user_position

			t.timestamps
		end
		add_index :user_vehicles, [:user_id, :service_id], unique: true
	end
end
