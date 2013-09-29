class Partido < ActiveRecord::Base
  attr_accessible :nombre, :provincia_id, :as => [:default, :admin]

  has_many :localidades
  belongs_to :provincia

  validates :nombre, :presence => true

end
