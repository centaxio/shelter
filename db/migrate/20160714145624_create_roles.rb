class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.integer :mask, null: false, default: 0
      t.string :code, limit: 20
      t.string :name, limit: 20

      t.timestamps
    end
  end
end
