class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :quantity, :category_id
  has_many :pictures
  belongs_to :category

  def self.search(searchTerm)
    if searchTerm
      return where("lower(#{:name}) like ?", "%#{searchTerm.downcase}%")
    else
      return where("id > 0")
    end
  end
end

