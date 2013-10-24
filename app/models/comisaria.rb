class Comisaria < ActiveRecord::Base
  attr_accessible :calle,
                  :nombre,
                  :numero,
                  :telefono,
                  :localidades,
                  :usuario_id,
                  :localidad_ids,
                  :as => [:default, :admin]

  belongs_to :usuario
  has_and_belongs_to_many :localidades

  validates :nombre, :presence => true, :length => { :minimum => 2, maximum: 50}
  validates :calle, :presence => true, :length => { :minimum => 2, maximum: 100 }
  validates :numero, :numericality => true
  validates :telefono, :presence => true, :length => { :minimum => 2, maximum: 50}

  def to_s
    nombre
  end

end
