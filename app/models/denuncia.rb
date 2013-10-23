class Denuncia < ActiveRecord::Base
  attr_accessible :comisaria_id,
                  :direccion_id,
                  :estado,
                  :observacion,
                  :as => [:default, :admin]

  belongs_to :direccion
  belongs_to :comisaria
end
