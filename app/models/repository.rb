class Repository < ApplicationRecord
  belongs_to :namespace
  has_many :repository_teams

  validates :name, format: /\A[a-zA-Z0-9_\.-]*\z/, presence: true, length: { in: 1..30 }
  default_value_for :pull_count, 0

  def admin_teams
    self.repository_teams.includes(:team).where(role: :admin).map(&:team) + [self.namespace.owners_team]
  end

  def admin_users
    admin_teams.reduce([]) { |users, at| users + at.users }.uniq
  end

  def writeable_teams
    self.repository_teams.includes(:team).where(role: [:write, :admin]).map(&:team) + [self.namespace.owners_team]
  end

  def writeable_users
    writeable_teams.reduce([]) { |users, at| users + at.users }.uniq
  end

  def readable_teams
    self.repository_teams.includes(:team).where(role: [:read, :write, :admin]).map(&:team) + [self.namespace.owners_team]
  end

  def readable_users
    readable_users.reduce([]) { |users, at| users + at.users }.uniq
  end

  class << self
    def all_repositories
      Rails.cache.fetch('registry/catalog', expires_in: 12.hours) do
      end
    end

    def refresh
      Rails.cache.delete('registry/catalog')
    end

    def role_for_user
    end
  end
end
