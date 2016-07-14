class CreateUserProjectRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_project_roles do |t|
      t.references :user, foreign_key: true
      t.references :project_role, foreign_key: true

      t.timestamps
    end
  end
end
