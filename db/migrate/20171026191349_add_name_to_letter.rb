class AddNameToLetter < ActiveRecord::Migration[5.1]
  def change
    add_column :letters, :name, :string, unique: true
  end
end
