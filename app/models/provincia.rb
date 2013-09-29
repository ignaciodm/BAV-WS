class Provincia < ActiveRecord::Base
  attr_accessible :nombre, :as => [:default, :admin]

  has_many :partidos

  validates :nombre, :presence => true

end
