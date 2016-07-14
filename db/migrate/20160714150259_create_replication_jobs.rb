class CreateReplicationJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :replication_jobs do |t|
      t.string :status, limit: 64, null: false
      t.references :replication_policy, null: false
      t.string :repository, limit: 256, null: false
      t.string :operation, limit: 64, null: false
      t.string :tags, limit: 16384

      t.timestamps
    end
  end
end
