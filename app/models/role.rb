class Role < ApplicationRecord
  has_many :project_roles
  has_many :project_members

  @@PROJECTADMIN = 1
  @@DEVELOPER = 2
  @@GUEST = 3
  cattr_reader :PROJECTADMIN, :DEVELOPER, :GUEST
end
