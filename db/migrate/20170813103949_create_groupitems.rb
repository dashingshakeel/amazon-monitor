class CreateGroupitems < ActiveRecord::Migration[5.0]
  def change
    create_table :groupitems do |t|
      t.string :name
      t.string :url
      t.references :group, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
     add_index :groupitems, :id
  end
end
