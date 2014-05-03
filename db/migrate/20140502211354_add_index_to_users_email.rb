class AddIndexToUsersEmail < ActiveRecord::Migration
	def change
		add_column :users, :blocked, :boolean, default: false
		add_index :users, :email, unique: true
	end
end
