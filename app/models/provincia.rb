class Provincia < ActiveRecord::Base
  attr_accessible :nombre, :as => [:admin]

  has_many :partidos

  validates :nombre, :presence => true

end
