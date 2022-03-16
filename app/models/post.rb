class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy , inverse_of: :post
  accepts_nested_attributes_for :comments
  has_many :likes, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  before_validation :normalize_name, on: :create
  private
    def normalize_name
      self.title = title.downcase.titleize
    end
  scope :with_long_title, -> { where("LENGTH(title) > 0") }  

end
