class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :quantity, :category_id
  has_many :pictures
  belongs_to :category
end
