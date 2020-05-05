class User < ApplicationRecord
  has_many :boards, dependent: :nullify
  has_one_attached :avatar

  validates :first_name, length: { within: 1..100 }
  validates :last_name, length: { within: 1..100 }
  validates :avatar, content_type:
                  { in: ['image/png', 'image/jpg', 'image/jpeg'],
                  message: "format is wrong, please use JPG, PNG or JPEG" }

  devise :database_authenticatable,
         :registerable, :validatable,
         :confirmable, :recoverable
end
