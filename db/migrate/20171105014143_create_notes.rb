class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.integer :client_id
      t.text :content

      t.timestamps
    end
    add_index :notes, :client_id
  end
end
