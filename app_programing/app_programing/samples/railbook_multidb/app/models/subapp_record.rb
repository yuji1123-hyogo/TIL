class SubappRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: { writing: :subapp, reading: :subapp_replica }
end
