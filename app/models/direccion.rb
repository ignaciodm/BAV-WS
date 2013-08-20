class Direccion < ActiveRecord::Base
  attr_accessible :comentarios, :descripcion, :numero, :calle, :piso, :departamento, :localidad_id, :usuario_id

  belongs_to :localidad
  belongs_to :usuario

  validates :descripcion, :presence => true, :length => { :minimum => 2 }
  validates :calle, :presence => true, :length => { :minimum => 2 }
  validates :numero, :numericality => true
  validates :piso, numericality: {only_integer: true}, :allow_nil => true
  validates :departamento, :length => {:maximum => 25}
  validates :localidad_id, :presence => true

  def partido
    localidad.partido
  end

  def provincia
    partido.provincia
  end

end
