class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.references :user, null: false
      t.string :name, limit: 20, null: false
      t.boolean :deleted, null: false, default: false
      t.boolean :public, null: false, default: false

      t.index :name, unique: true

      t.timestamps
    end
  end
end
