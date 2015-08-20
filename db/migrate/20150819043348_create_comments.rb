class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.text :content
			t.references :user
			t.references :request
			t.timestamps null: false
		end
	end
end
