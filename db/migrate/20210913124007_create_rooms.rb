class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|

      t.string :name,        null: false
      t.text :concept,       null: false
      t.string :score,       null: false
      t.string :about_age,   null: false
      t.string :member,      null: false
      t.timestamps
    end
  end
end
