class Localidad < ActiveRecord::Base
  attr_accessible :comisarias, :as => [:default, :admin]

  attr_accessible :nombre,
                  :partido_id,:as => [:admin]

  belongs_to :partido
  has_and_belongs_to_many :comisarias

  validates :nombre, :presence => true


  def form_name
    "#{partido.provincia.nombre} | #{partido.nombre} | #{nombre}"
  end

end
