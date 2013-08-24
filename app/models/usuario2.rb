#class Usuario < ActiveRecord::Base
#  attr_accessible :nombre, :apellido, :dni, :bloqueado, :direcciones
#
#  has_many :direcciones
#
#  validates :nombre, :presence => true, :length => { :minimum => 2, maximum: 50}
#  validates :apellido, :presence => true, :length => { :minimum => 2, maximum: 50}
#  validates :dni, :presence => true, :length => { :minimum => 2, maximum: 25}
#
#end
