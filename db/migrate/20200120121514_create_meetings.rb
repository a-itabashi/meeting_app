class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
