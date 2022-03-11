class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :timeline, null: false, foreign_key: true
      t.timestamps
    end
  end
end
