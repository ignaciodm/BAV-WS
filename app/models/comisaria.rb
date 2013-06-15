class Comisaria < ActiveRecord::Base
  attr_accessible :calle, :nombre, :numero, :telefono, :localidades

  has_and_belongs_to_many :localidades

  validates :nombre, :presence => true, :length => { :minimum => 2, maximum: 50}
  validates :calle, :presence => true, :length => { :minimum => 2, maximum: 100 }
  validates :numero, :numericality => true
  validates :telefono, :presence => true, :length => { :minimum => 2, maximum: 50}

  def as_json(options={})
    ret = super(:only => [:id, :calle, :nombre, :numero, :telefono])
    ret[:localidades] = localidades.as_json
    ret
  end

end
