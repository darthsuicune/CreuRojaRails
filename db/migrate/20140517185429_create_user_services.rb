class CreateUserServices < ActiveRecord::Migration
	def change
		create_table :user_services, id: false do |t|
			t.string :user_type
			t.integer :user_id
			t.integer :service_id

			t.timestamps
		end
		
		add_index :user_services, [:user_id, :service_id], unique: true
		add_index :user_services, [:user_type]
	end
end
