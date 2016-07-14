class Role < ApplicationRecord
  has_many :project_roles
  has_many :project_members
end
