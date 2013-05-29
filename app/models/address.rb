class Address < ActiveRecord::Base
  attr_accessible :details, :name, :number, :street

  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :street, :presence => true, :length => { :minimum => 2 }
  validates :number, :numericality => true


end
