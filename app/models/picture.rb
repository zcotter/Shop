class Picture < ActiveRecord::Base
  belongs_to :product
  attr_accessible :photo
  has_attached_file :photo, :styles => { :small => "150x150>", :large => "500x500>" }
end
