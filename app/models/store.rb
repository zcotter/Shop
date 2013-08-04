class Store < ActiveRecord::Base
  attr_accessible :description, :email, :location, :name, :owner, :logo
  has_attached_file :logo, :styles => { :small => "50x50>", :large => "100x100>" }
end
