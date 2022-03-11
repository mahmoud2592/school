class CreateTimelines < ActiveRecord::Migration[6.1]
  def change
    create_table :timelines do |t|
      t.datetime :from
      t.datetime :to
      t.references :teacher, null: false, foreign_key: true
      t.timestamps
    end
  end
end
