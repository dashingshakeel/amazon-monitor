class AddCoulumToGroupitems < ActiveRecord::Migration[5.0]
  def change
    add_column :groupitems, :reply, :string
  end
end
