class CreateLetters < ActiveRecord::Migration[5.1]
  def change
    create_table :letters do |t|
      t.text :content
      t.string :to
      t.string :from
      t.string :cc
      t.string :bcc
      t.boolean :template
      t.boolean :email
      t.datetime :sent

      t.timestamps
    end
  end
end
