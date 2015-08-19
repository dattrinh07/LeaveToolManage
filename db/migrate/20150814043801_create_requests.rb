class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.datetime :leave_date
      t.datetime :comeback_date
      t.text :description
      t.timestamps null: false
      t.string  :leave_status, default: '0'
      t.string  :leave_type
      t.references :user
    end
  end
end