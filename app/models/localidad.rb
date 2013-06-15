class Localidad < ActiveRecord::Base
  attr_accessible :nombre, :partido_id, :comisarias

  belongs_to :partido
  has_and_belongs_to_many :comisarias

  def as_json(options={})
    ret = super(:only => [:id, :nombre])
    ret[:partido] = partido.as_json
    ret
  end

end
