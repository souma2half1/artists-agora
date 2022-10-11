class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|

      t.timestamps
      t.integer :user_id,    null: false
      t.integer :work_id,    null: false
      t.integer :comment_id, null: false
      t.text :body,        null: false
    end
  end
end
