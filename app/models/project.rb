class Project < ApplicationRecord
  belongs_to :user
  has_many :project_members
  has_many :project_roles

  def add_member(user, role)
    # TODO
  end

  def repo_count
    # TODO
    2
  end
end
