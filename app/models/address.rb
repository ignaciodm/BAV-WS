class Address < ActiveRecord::Base
  attr_accessible :details, :name, :number, :street, :floor, :flat

  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :street, :presence => true, :length => { :minimum => 2 }
  validates :number, :numericality => true
  validates :floor, numericality: {only_integer: true}, :allow_nil => true
  validates :flat, :length => {:maximum => 25}

end
