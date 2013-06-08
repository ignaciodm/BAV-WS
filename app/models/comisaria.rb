class Comisaria < ActiveRecord::Base
  attr_accessible :calle, :nombre, :numero, :telefono

  validates :nombre, :presence => true, :length => { :minimum => 2, maximum: 50}
  validates :calle, :presence => true, :length => { :minimum => 2, maximum: 100 }
  validates :numero, :numericality => true
  validates :telefono, :presence => true, :length => { :minimum => 2, maximum: 50}

end
