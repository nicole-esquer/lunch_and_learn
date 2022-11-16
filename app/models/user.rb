class User < ApplicationRecord
  before_create { self[:api_key] = create_api_key }

  validates_presence_of(:api_key)
  validates_presence_of(:email)
  validates_uniqueness_of(:email)
  validates_presence_of(:name)
  validates_presence_of(:password)

  has_many(:favorites)

  has_secure_token(:api_key)
  has_secure_password

  def create_api_key
    SecureRandom.hex(15)
  end
end
