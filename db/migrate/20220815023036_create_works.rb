class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|

      t.timestamps
       t.integer :user_id,     null: false
       t.string :title,         null: false
       t.text :introduction,   null: false
       t.string :genre
    end
  end
end
