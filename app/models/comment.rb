class Comment < ApplicationRecord
  belongs_to :post
  has_many :clikes, dependent: :destroy
end
