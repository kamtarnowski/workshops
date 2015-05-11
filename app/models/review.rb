class Review < ActiveRecord::Base
  after_create :category_rating unless Rails.env.test?

  belongs_to :product
  belongs_to :user

  validates_presence_of :content, :user_id
  validates :rating, presence: true, inclusion: { in: 1..5 }

  def category_rating
    category = self.product.category
    array = []
    category.products.each do |product|
      array += product.reviews.pluck(:rating)
    end
    sum = array.reduce(:+)
    amount = array.count
    average = (sum / amount).to_f
    category.update(average_rating: average)
  end
end


# category = self.product.category
# array = []
# category.products.each do |product|
#   array += product.reviews.pluck(:rating)
# end
# sum = array.reduce(:+)
# amount = array.count
# average = (sum / amount).to_f
# category.update(average_rating: average)