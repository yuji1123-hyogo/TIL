class Entry < ApplicationRecord
  delegated_type :entryable, types: %w[Comment Note]
  delegate :body, to: :entryable
end
