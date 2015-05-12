class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :description, :title
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

  def average_rating
    count = self.reviews.count
    sum = self.reviews.pluck(:rating).reduce(:+).to_f
    (sum / count)
  end

  def to_param
    "#{id} #{title.truncate(25, omission: '...')}".parameterize
  end
end
