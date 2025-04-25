class Note < ApplicationRecord
  has_one :entry, as: :entryable, touch: true
  def body
    "#{header}: #{text}"
  end
end
