class CreateBookes < ActiveRecord::Migration[6.1]
  def change
    create_table :bookes do |t|
      t.references :student, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true
      t.timestamps
    end
  end
end
