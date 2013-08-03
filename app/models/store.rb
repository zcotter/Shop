class Store < ActiveRecord::Base
  attr_accessible :description, :email, :location, :name, :owner
end
