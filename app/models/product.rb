class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :quantity, :category_id
  has_many :pictures
  belongs_to :category

  def self.search(searchTerm)
    if searchTerm
      searchClause = "%#{searchTerm.downcase}%"
      return where("lower(#{:name}) like ? OR lower(#{:description}) like ?", searchClause, searchClause)
    else
      return where(nil)
    end
  end
end

