class Store < ActiveRecord::Base
  attr_accessible :description, :email, :location, :name, :owner, :logo, :cover
  has_attached_file :logo, :styles => { :small => "50x50>", :large => "100x100>" }
  has_attached_file :cover, :styles => { :small => "100x100>", :large => "1000x1000>" }

end
