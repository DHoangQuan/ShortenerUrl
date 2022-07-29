class CreateLink < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.integer :user_id, null: false
      t.string :slug, null: false
      t.text :link, null: false

      t.timestamps
    end

    add_index :links, %i[slug link], unique: true
    add_index :links, :user_id
  end
end
