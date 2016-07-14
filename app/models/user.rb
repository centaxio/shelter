class User < ApplicationRecord
  has_many :projects
  has_many :project_members
  has_many :user_project_roles
end
