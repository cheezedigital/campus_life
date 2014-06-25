class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :encrypted_password
      t.date :birthday
      t.text :hobbies
      t.string :github_username
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
