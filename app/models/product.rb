class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :quantity
  has_many :pictures
  belongs_to :category
end
