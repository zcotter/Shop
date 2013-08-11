class Category < ActiveRecord::Base
  has_many :products
  attr_accessible :name
  validates :name,
            :presence => true
  def get_name
    "#{name}"
  end

end
