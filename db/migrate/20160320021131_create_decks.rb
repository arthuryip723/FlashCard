class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      # t.integer :user_id, null: false
      t.string :name, null: false
      t.timestamps null: false
    end

    # add_index :decks, :user_id
  end
end
