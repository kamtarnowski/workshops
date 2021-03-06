class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :firstname, :lastname

  has_many :reviews
  has_many :products

  def to_param
    "#{id} #{(firstname+lastname).truncate(25, omission: '...')}".parameterize
  end
end
