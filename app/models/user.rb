class User < ApplicationRecord
  has_many :projects
  has_many :project_members
  has_many :user_project_roles

  def can_read_project(project)
    # TODO
    true
  end

  # TODO: test this
  def roles(project)
    if is_admin
      Role.find_by(id: Role.PROEJECTADMIN)
    else
      project_roles(project)
    end
  end

  def project_roles(project)
    project.project_member.where(user: self).roles
  end

  def has_project_admin_role project
    # TODO
    true
  end

  def relevant_projects(project_name = nil)
    # TODO
    Project.all
  end

  def is_project_admin(project)
    return true if is_admin
    project_roles(project).each do |role|
      return true if role.id == Role.PROJECTADMIN
    end
    false
  end
end
