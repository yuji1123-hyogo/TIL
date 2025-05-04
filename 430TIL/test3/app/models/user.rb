class User < ApplicationRecord
  has_secure_password

  validates :name,presence:true
  validates :emai,presence: true,uniqueness: true

  has_many :tasks
end
