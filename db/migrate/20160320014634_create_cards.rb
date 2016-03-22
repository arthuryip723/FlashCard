class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :deck_id, null: false
      t.string :front, null: false
      t.string :back, null: false
      t.timestamps null: false
    end

    add_index :cards, :deck_id
  end
end
