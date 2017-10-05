class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :case_id
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.text :notes

      t.timestamps
    end
  end
end
