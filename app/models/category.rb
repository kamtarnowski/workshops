class Category < ActiveRecord::Base
  has_many :products

  validates :name, uniqueness: true

  def to_param
    "#{id} #{name.truncate(25, omission: '...')}".parameterize
  end
end
