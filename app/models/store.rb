class Store < ActiveRecord::Base
  attr_accessible :description, :email, :location, :name, :owner, :logo, :cover
  has_attached_file :logo, :styles => { :small => "50x50>", :large => "100x100>" }
  has_attached_file :cover, :styles => { :large => "2000x2000>" }

end
