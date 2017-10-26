class AddClientIdToLetter < ActiveRecord::Migration[5.1]
  def change
    add_column :letters, :client_id, :integer
    add_index :letters, :client_id
  end
end
