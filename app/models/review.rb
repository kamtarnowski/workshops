class Review < ActiveRecord::Base
  after_create(:category_rating, :product_rating) unless Rails.env.test?
  after_destroy(:category_rating, :product_rating) unless Rails.env.test?
  after_update(:category_rating, :product_rating) unless Rails.env.test?

  belongs_to :product
  belongs_to :user

  validates_presence_of :content, :user_id
  validates :rating, presence: true, inclusion: { in: 1..5 }

  default_scope { order(created_at: :desc) }

  def category_rating
    category = self.product.category
    array = []
    category.products.each do |product|
      array += product.reviews.pluck(:rating)
    end
    sum = array.reduce(:+).to_f
    amount = array.count
    average = (sum / amount)
    category.update(average_rating: average)
  end

  def product_rating
    product = self.product
    array = product.reviews.pluck(:rating)
    sum = array.reduce(:+).to_f
    amount = array.count
    average = (sum / amount)
    product.update(average_rat: average)
  end

  def to_param
    "#{id} #{content.truncate(25, omission: '...')}".parameterize
  end
end