class Localidad < ActiveRecord::Base
  attr_accessible :comisarias, :as => [:default, :admin]

  attr_accessible :nombre,
                  :partido_id,:as => [:default, :admin]

  belongs_to :partido
  has_and_belongs_to_many :comisarias

  validates :nombre, :presence => true

  def to_s
    "#{nombre} - #{partido.nombre} - #{partido.provincia.nombre}"
  end


  def form_name
    "#{partido.provincia.nombre} | #{partido.nombre} | #{nombre}"
  end

end
