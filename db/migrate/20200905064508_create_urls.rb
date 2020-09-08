class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :destination
      t.references :user, null: false, foreign_key: true
      t.string :key
      t.string :full_url
      t.integer :clicked, default: 0
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
