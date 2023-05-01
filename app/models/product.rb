class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }

  has_one_attached :avatar do |avatar|
    avatar.variant :thumb, resize_to_limit: [100, 100]
    avatar.variant :medium, resize_to_limit: [400, 400]
  end
   
end
