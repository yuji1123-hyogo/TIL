class Book < ApplicationRecord
  # attribute :price, :float

  scope :gihyo, -> { where(publisher: '技術評論社') }
  scope :newer, -> { order(published: :desc) }
  scope :top10, -> { newer.limit(10) }
  scope :whats_new, ->(pub) {
    where(publisher: pub).order(published: :desc).limit(5)
  }

  has_many :reviews
  # self.strict_loading_by_default = true
  # has_many :reviews, strict_loading: true
  has_and_belongs_to_many :authors
  # has_and_belongs_to_many :authors, dependent: :destroy
  has_many :users, through: :reviews
  has_many :memos, as: :memoable

=begin
  validates :isbn,
    presence: true,
    uniqueness: true,
    length: { is: 17 },
    format: { with: /\A978-4-[0-9]{2,5}-[0-9]{2,5}-[0-9X]\z/ }
=end

=begin
  #空白時に検証をスキップする
  validates :isbn,
  presence: true,
  uniqueness: { allow_blank: true },
  length: { is: 17 , allow_blank: true },
  format: { with: /\A978-4-[0-9]{2,7}-[0-9]{1,6}-[0-9X]{1}\z/, allow_blank: true }
=end

  # validates :title,
  #   presence: true,
  #   length: { minimum: 1, maximum: 100 }

  # validates :price,
  #   numericality: { only_integer: true, less_than: 10000 }

  # validates :publisher,
  #   inclusion:{ in: ['技術評論社', '翔泳社', 'SBクリエイティブ', '日経BP', '森北出版'] }

  # validates :title, uniqueness: { scope: :publisher }

=begin
  #エラーメッセージを日本語化
  validates :isbn,
  presence: { message: 'は必須です'},
  uniqueness: { allow_blank: true,
    message: '%{value}は一意でなければなりません' },
  length: { is: 17 , allow_blank: true,
    message: '%{value}は%{count}桁でなければなりません' },
  format: { with: /\A978-4-[0-9]{2,5}-[0-9]{2,5}-[0-9X]\z/,
    allow_blank: true, message: '%{value}は正しい形式ではありません' }
=end


  #IsbnValidatorクラスによる検証
  # validates :isbn,
  #   presence: true,
  #   uniqueness: true,
  #   isbn: true
  #   # isbn: { allow_old: true }


  # プライベートメソッドによる検証
  # validate :isbn_valid?

  #コールバックメソッド
  # after_destroy :history_book

  # 条件付きでコールバックを適用
  # after_destroy :history_book,
  #   unless: ->(b) { b.publisher == "unknown" }

  # コールバックメソッドをブロック形式で定義
  # after_destroy do |b|
  #   logger.info("deleted: #{b.inspect}")
  # end

  # コールバッククラスとして定義
  # after_destroy BookCallbacks.new

  private
  def history_book
    logger.info("deleted: #{self.inspect}")
  end

  def isbn_valid?
    errors.add(:isbn, 'は正しい形式ではありません。') unless /\A978-4-[0-9]{2,5}-[0-9]{2,5}-[0-9X]\z/ === isbn && isbn.length == 17
  end
end
