class RepositoryTeam < ApplicationRecord
  belongs_to :team
  belongs_to :repository
  enum role: { admin: 0, write: 1, read: 2 }
end
