class Localidad < ActiveRecord::Base
  attr_accessible :nombre, :partido_id

  belongs_to :partido
end
