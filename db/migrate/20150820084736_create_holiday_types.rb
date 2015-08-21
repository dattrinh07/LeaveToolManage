class CreateHolidayTypes < ActiveRecord::Migration
  def change
    create_table :holiday_types do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
