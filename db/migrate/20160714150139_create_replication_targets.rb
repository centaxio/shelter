class CreateReplicationTargets < ActiveRecord::Migration[5.0]
  def change
    create_table :replication_targets do |t|
      t.string :name, limit: 64
      t.string :url, limit: 64
      t.string :username, limit: 40
      t.string :password, limit: 40
      t.integer :target_type, null: false, default: 0

      t.timestamps
    end
  end
end
