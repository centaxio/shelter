class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :k, null: false
      t.string :v, null: false

      t.index :k
      t.index :v

      t.timestamps
    end
  end
end
