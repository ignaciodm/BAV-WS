class Address < ActiveRecord::Base
  attr_accessible :details, :name, :number, :street

  validates :name, :presence => true, :length => { :minimum => 2 }

end
