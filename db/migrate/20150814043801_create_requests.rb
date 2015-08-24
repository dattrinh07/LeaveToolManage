class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.datetime :leave_date
      t.datetime :comeback_date
      t.text :description
      t.timestamps null: false
      t.string  :leave_status, default: '0'
      t.integer  :holiday_type_id
      t.references :user
    end
  end
end