class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.datetime :leave_date
      t.datetime :comeback_date
      t.integer :request_type
      t.text :description
      t.integer :status_request

      t.timestamps null: false
      t.integer  :leave_status, default: 0
      t.integer  :leave_type, default: 0
    end
  end
end