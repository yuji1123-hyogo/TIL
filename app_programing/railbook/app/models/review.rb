class Review < ApplicationRecord
  encrypts :body

  # enum status: { draft:0, published:1, deleted:2 }
  # enum status: [:draft, :published, :deleted]

  belongs_to :book

  # キャッシュの依存性を設定
  # belongs_to :book, touch: true

  belongs_to :user
  # belongs_to :user, counter_cache: true

  # default_scope { order(updated_at: :desc) }

end
