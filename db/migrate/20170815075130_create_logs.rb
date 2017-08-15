class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :groupitem, foreign_key: true
      t.string :reply
      t.timestamps
    end
  end
end
