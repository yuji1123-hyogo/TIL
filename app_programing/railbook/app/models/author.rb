class Author < ApplicationRecord
  belongs_to :user

  has_one_attached :photo
  # has_one_attached :photo, service: :microsoft

  # 名前付きバリアントを定義
  # has_one_attached :photo do |attachable|
  #   attachable.variant :thumb, resize_to_limit: [100, 100]
  # end

  # 複数のファイルを紐づけ
  # has_many_attached :photos

  has_and_belongs_to_many :books
  # has_and_belongs_to_many :books, dependent: :destroy
  has_many :comments, -> { where(deleted: false) }, class_name: 'FanComment',
  foreign_key: 'author_no'

  has_many :memos, as: :memoable

  validates :birth,
  comparison: { less_than: Date.new(2020, 12, 31) }
  # comparison: { less_than: -> _ { Date.today } }
end
