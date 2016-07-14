class CreateReplicationPolicies < ActiveRecord::Migration[5.0]
  def change
    create_table :replication_policies do |t|
      t.string :name, limit: 256
      t.references :project, foreign_key: true
      t.integer :target_id, null: false
      t.boolean :enabled, null: false, default: true
      t.text :description
      t.string :cron_str, limit: 256
      t.timestamp :start_time

      t.timestamps
    end
  end
end
