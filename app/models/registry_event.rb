class RegistryEvent < ApplicationRecord
  after_create :sync_event_to_entity
  def sync_event_to_entity
    Repository.refresh if self.action == 'push'
  end
end
