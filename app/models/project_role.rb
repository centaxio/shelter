class ProjectRole < ApplicationRecord
  belongs_to :project
  belongs_to :role
  has_many :user_project_roles
end
