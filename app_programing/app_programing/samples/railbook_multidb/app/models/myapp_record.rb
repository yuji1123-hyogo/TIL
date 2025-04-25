class MyappRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: { writing: :myapp, reading: :myapp_replica }
end
