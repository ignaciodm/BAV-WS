class Provincia < ActiveRecord::Base
  attr_accessible :nombre

  has_many :partidos

  validates :nombre, :presence => true

end
