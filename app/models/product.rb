class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :quantity, :category_id
  has_many :pictures
  belongs_to :category

  validates :price,
            :numericality => {:greater_than_or_equal_to => 0}
  validates :quantity,
            :numericality => {only_integer: true,
                              greater_than_or_equal_to: 0}

  def self.search(searchTerm)
    if searchTerm
      searchClause = "%#{searchTerm.downcase}%"
      #TODO modify so name matches come before description matches
      return where("lower(#{:name}) like ? OR lower(#{:description}) like ?", searchClause, searchClause)
    else
      return where(nil)
    end
  end
end

