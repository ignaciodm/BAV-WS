require 'rspec'

describe UsuariosController do
  render_views
  include Devise::TestHelpers

  describe "create" do

    it "creates the user and call confirmation instructions" do
      post :create, {:format => 'json',
                     usuario: {
          nombre: 'nacho',
          apellido: 'de maio',
          email: 'ignaciodemaio@gmail.com',
          password: 'nacho123',
          telefono: '4644-4444',
          fechaDeNacimiento: "1989-02-25",
          dni: '34108898'}
      }
      expect(response).to render_template('usuarios/mailer/confirmation_instructions')
      usuario = Usuario.first
      response.body.should == "{\"id\":#{usuario.id},\"nombre\":\"nacho\",\"apellido\":\"de maio\"," +
          "\"dni\":\"34108898\",\"email\":\"ignaciodemaio@gmail.com\"," +
          "\"telefono\":\"4644-4444\",\"fechaDeNacimiento\":\"1989-02-25\"," +
          "\"authToken\":\"#{usuario.authentication_token}\"," +
          "\"bloqueado\":false,\"direcciones\":[]}"
    end

    it "returns a json with the fields that have errors" do
      post :create, {:format => 'json',
                     usuario: {
                         nombre: 'nacho',
                         apellido: 'de maio',
                         email: 'ignaciodemaio@gmail.com',
                         password: 'nacho123',
                         fechaDeNacimiento: "",
                         dni: '34108898'}
      }

      response.status.should == 400
      response.body.should == "{\"telefono\":[\"can't be blank\",\"is too short (minimum is 6 characters)\"],\"fechaDeNacimiento\":[\"can't be blank\"]}"
    end
  end

  describe "update" do


    it "updates a user and returns the user updated" do
      usuario = Usuario.create!({
                                    nombre: 'nacho',
                                    apellido: 'de maio',
                                    email: 'ignaciodemaio@gmail.com',
                                    password: 'nacho123',
                                    telefono: '4644-4444',
                                    fecha_de_nacimiento: Date.new(1989, 02, 25),
                                    dni: '34108898',
                                    confirmed_at: DateTime.now})

      put :update, {:format => 'json',
                     id: usuario.id,
                     authToken: usuario.authentication_token,
                     usuario: {
                         nombre: 'Ignacio Miguel',
                         apellido: 'De Maio',
                         telefono: '4643-1282',
                         fechaDeNacimiento: "1989-02-26"}
      }

      response.status.should == 200
      JSON.parse(response.body).should == {"id"=>usuario.id,
                                           "nombre"=>"Ignacio Miguel",
                                           "apellido"=>"De Maio",
                                           "dni"=>"34108898",
                                           "email"=>"ignaciodemaio@gmail.com",
                                           "telefono"=>"4643-1282",
                                           "fechaDeNacimiento"=>"1989-02-26",
                                           "authToken"=>usuario.authentication_token,
                                           "bloqueado"=>false,
                                           "direcciones"=>[]}
    end

    context 'when the auth token is not passed' do

      it "should return unauthorized" do
        usuario = Usuario.create!({
                                      nombre: 'nacho',
                                      apellido: 'de maio',
                                      email: 'ignaciodemaio@gmail.com',
                                      password: 'nacho123',
                                      telefono: '4644-4444',
                                      fecha_de_nacimiento: Date.new(1989, 02, 25),
                                      dni: '34108898',
                                      confirmed_at: DateTime.now})

        put :update, {:format => 'json',
                      id: usuario.id,
                      usuario: {
                          nombre: 'Ignacio Miguel',
                          apellido: 'De Maio',
                          telefono: '4643-1282',
                          fechaDeNacimiento: "1989-02-26"}
        }

        response.status.should == 401
      end
    end

  end

  describe "login" do

    it "should login correctly" do
      usuario = Usuario.create!({
                          nombre: 'nacho',
                          apellido: 'de maio',
                          email: 'ignaciodemaio@gmail.com',
                          password: 'nacho123',
                          telefono: '4644-4444',
                          fecha_de_nacimiento: Date.new(1989, 02, 25),
                          dni: '34108898'})

      post :login, {:format => 'json', email: usuario.email, password: usuario.password }
      response.status.should == 200
      response.body.should == "{\"id\":#{usuario.id},\"nombre\":\"nacho\",\"apellido\":\"de maio\"," +
                              "\"dni\":\"34108898\",\"email\":\"ignaciodemaio@gmail.com\"," +
                              "\"telefono\":\"4644-4444\",\"fechaDeNacimiento\":\"1989-02-25\"," +
                              "\"authToken\":\"#{usuario.authentication_token}\"," +
                              "\"bloqueado\":false,\"direcciones\":[]}"
    end
  end
end