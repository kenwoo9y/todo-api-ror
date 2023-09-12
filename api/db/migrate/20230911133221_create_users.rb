class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_name, limit: 30, null: false
      t.string :email, limit: 80, null: false
      t.string :last_name, limit: 40
      t.string :first_name, limit: 40
      t.string :password_digest, null: false

      t.timestamps
      t.index :user_name, unique: true
      t.index :email, unique: true
    end
  end
end
