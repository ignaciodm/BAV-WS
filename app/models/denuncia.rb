class Denuncia < ActiveRecord::Base
  attr_accessible :comisaria_id,
                  :direccion_id,
                  :estado,
                  :observacion

  belongs_to :direccion
  belongs_to :comisaria
end
