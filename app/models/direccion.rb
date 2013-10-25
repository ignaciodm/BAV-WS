class Direccion < ActiveRecord::Base
  attr_accessible :comentarios,
                  :descripcion,
                  :numero,
                  :calle,
                  :piso,
                  :departamento,
                  :localidad_id,
                  :usuario_id,
                  :comisaria_id,
                  :entre_calle_1,
                  :entre_calle_2,
                  :as => [:default, :admin]

  has_many :denuncias
  belongs_to :localidad
  belongs_to :comisaria
  belongs_to :usuario

  validates :descripcion, :presence => true, :length => { :minimum => 2 }
  validates :calle, :presence => true, :length => { :minimum => 2 }
  validates :numero, :numericality => true
  validates :piso, numericality: {only_integer: true}, :allow_nil => true
  validates :departamento, :length => {:maximum => 25}
  validates :localidad_id, :presence => true
  validates :comisaria_id, :presence => true

  def to_s
    "#{descripcion} #{calle} #{numero}"
  end


  #validates entre_calles

  #def entre_calles
  #  if entre_calle_1.blank? && entre_calle_2.present?
  #    errors[:entre_calle_1] = "can't be blank if entre_calle_2 is set"
  #  end
  #
  #  if entre_calle_1.present? && entre_calle_2.blank?
  #    errors[:entre_calle_2] = "can't be blank if entre_calle_1 is set"
  #  end
  #
  #  true
  #end

  def partido
    localidad.partido
  end

  def provincia
    partido.provincia
  end

end
