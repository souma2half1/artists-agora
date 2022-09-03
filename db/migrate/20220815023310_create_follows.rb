class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|

      t.timestamps
      t.integer :user_id, null: false
    end
  end
end
