class Direccion < ActiveRecord::Base
  attr_accessible :comentarios, :descripcion, :numero, :calle, :piso, :departamento

  validates :descripcion, :presence => true, :length => { :minimum => 2 }
  validates :calle, :presence => true, :length => { :minimum => 2 }
  validates :numero, :numericality => true
  validates :piso, numericality: {only_integer: true}, :allow_nil => true
  validates :departamento, :length => {:maximum => 25}

end
