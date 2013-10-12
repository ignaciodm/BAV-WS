require 'rspec'

describe DireccionesController do
  render_views
  include Devise::TestHelpers

  before(:each) do
    @provincia = Provincia.create(nombre: 'Buenos Aires')
    @partido = Partido.create(nombre: 'San Isidro', provincia_id: @provincia.id)
    @localidad = Localidad.create(nombre: 'Beccar', partido_id: @partido.id)
    @comisaria = Comisaria.create({nombre: 'Comisaria 44', calle: 'calle', numero: 10, telefono: '4643-1282'})

    @usuario = Usuario.create!({
                                  nombre: 'nacho',
                                  apellido: 'de maio',
                                  email: 'ignaciodemaio20@gmail.com',
                                  password: 'nacho123',
                                  dni: '34108898',
                                  telefono: '4644-4444',
                                  fecha_de_nacimiento: Date.new(1989, 02, 25),
                                  confirmed_at: Time.now})
    sign_in(@usuario)
  end

  describe "create" do

    it "creates a direccion" do
      post :create, {:format => 'json',
                     id: @usuario.id,
                     auth_token: @usuario.authentication_token,
                     direccion: {
                        descripcion: 'nacho',
                        calle: 'Dupuy',
                        numero: '930',
                        localidad_id: @localidad.id,
                        comisaria_id: @comisaria.id
                     }
      }
      response.status.should == 200
      response.body.should == "{\"id\":1,\"descripcion\":\"nacho\",\"numero\":930,\"calle\":\"Dupuy\",\"piso\":null,\"departamento\":null,\"showUrl\":\"http://test.host/usuarios/1/direcciones/1\"}"
    end

    it "creates a direccion" do
      post :create, {:format => 'json',
                     id: @usuario.id + 1,
                     auth_token: @usuario.authentication_token,
                     direccion: {
                         descripcion: 'nacho',
                         calle: 'Dupuy',
                         numero: '930',
                         localidad_id: @localidad.id,
                         comisaria_id: @comisaria.id
                     }
      }
      response.status.should == 401
      response.body.should == 'El contenido al que quiere acceder no pertenece a este usuario'
    end
  end

end