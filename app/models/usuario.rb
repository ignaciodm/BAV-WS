class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable,
         :validatable, :token_authenticatable, :confirmable, :lockable

  # Setup accessible (or protected) attributes for your model

  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :nombre,
                  :apellido,
                  :dni,
                  :telefono,
                  :fecha_de_nacimiento,
                  :direcciones,
                  :confirmed_at,
                  :is_comisaria,
                  :as => [:default, :admin]

  attr_accessible :admin, as: :admin
  #attr_accessible :title, :body


  has_one :comisaria
  has_many :direcciones

  accepts_nested_attributes_for :direcciones

  validates :nombre, :presence => true, :length => { :minimum => 2, maximum: 50}
  validates :apellido, :presence => true, :length => { :minimum => 2, maximum: 50}
  validates :dni, :presence => true, :length => { :minimum => 2, maximum: 25}
  validates :telefono, :presence => true, :length => { :minimum => 6, maximum: 50}
  validates :fecha_de_nacimiento, :presence => true

  before_create :add_authentication_token

  def to_s
    email
  end

  def denuncias
    direcciones.map(&:denuncias).flatten.compact.uniq
  end

  private
  def add_authentication_token
    curr_date = DateTime.current().utc()
    self.authentication_token = Digest::SHA1.hexdigest(self.email + curr_date.to_s)
  end

end
