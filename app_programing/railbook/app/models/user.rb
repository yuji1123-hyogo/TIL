class User < ApplicationRecord
  has_secure_password

  generates_token_for :password_reset, expires_in: 30.minutes do
    password_salt&.last(15)
  end

  has_one :author
  has_many :reviews
  has_many :books, through: :reviews

  normalizes :email, with: -> email { email.strip.downcase }

  # validates :agreement, acceptance: true
  # validates :agreement, acceptance: { accept: 'yes' }
  validates :agreement, acceptance: { on: :create }

  # validates :email, confirmation: true

  #dm欄にチェックした場合にのみ、メールアドレスを必須
  validates :email,
    presence: { unless: ->(u) { u.dm.blank? } }
    # presence: { if: ->(u) { u.dm.present? } }

  # シンボルで条件を指定
  # validates :email, presence: { unless: :sendmail? }
  #
  # def sendmail?
  #   dm.blank?
  # end

  #dm欄にチェックした場合にのみ、メールアドレス／ロール欄を必須
  # with_options unless: ->(dm) { dm.blank? } do |dm|
  #   dm.validates :email, presence: true
  #   dm.validates :roles, presence: true
  # end
end
