class Partido < ActiveRecord::Base
  attr_accessible :nombre, :provincia_id

  has_many :localidades
  belongs_to :provincia

  def as_json(options={})
    ret = super(:only => [:id, :nombre])
    if options[:nested]
      options[:nested].each { |v| ret[v.to_sym] = selprovincia.as_json }
    end
    ret[:provincia] = provincia.as_json
    ret
  end
end
