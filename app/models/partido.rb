class Partido < ActiveRecord::Base
  attr_accessible :nombre, :provincia_id

  has_many :localidades
  belongs_to :provincia
end
