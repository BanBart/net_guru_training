class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews, after_add: :update_average_rating, after_remove: :update_average_rating
  
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  
  private
  
  def update_average_rating(review = nil)
    self.update_attribute(:average_rating, self.reviews.average(:rating))
  end
end
