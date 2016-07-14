class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 15
      t.string :email, limit: 30
      t.string :password_digest, null: false
      t.string :realname, limit: 20, null: false
      t.string :comment, limit: 30
      t.boolean :deleted, null: false, default: false
      t.string :reset_uuid, limit: 40
      t.integer :sysadmin_flag

      t.index :username, unique: true
      t.index :email, unique: true

      t.timestamps
    end
  end
end
