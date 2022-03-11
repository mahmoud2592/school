class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :subject
      t.string :duration
      t.timestamps
    end
  end
end
