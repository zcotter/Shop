class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :quantity, :category_id
  has_many :pictures
  belongs_to :category

  def self.search(searchTerm)
    if searchTerm
      find(:all, :conditions => ['name like ?', "%#{searchTerm}%"])
    else
      find(:all)
    end
  end
end

