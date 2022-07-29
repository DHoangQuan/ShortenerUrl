class CreateLinkStat < ActiveRecord::Migration[6.1]
  def change
    create_table :link_stats do |t|
      t.integer :link_id, null: false
      t.integer :clicked, null: false, default: 0

      t.timestamps
    end
  end
end
