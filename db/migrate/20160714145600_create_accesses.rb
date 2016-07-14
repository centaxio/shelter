class CreateAccesses < ActiveRecord::Migration[5.0]
  def change
    create_table :accesses do |t|
      t.string :code, limit: 1
      t.string :comment, limit: 30

      t.timestamps
    end
  end
end
