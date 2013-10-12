require 'rspec'

describe UsuariosController do
  render_views

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
          "\"telefono\":\"4644-4444\",\"fechaDeNacimiento\":\"1989-02-25T00:00:00Z\"," +
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

      response.body.should == "{\"telefono\":[\"can't be blank\",\"is too short (minimum is 6 characters)\"],\"fechaDeNacimiento\":[\"can't be blank\"]}"
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
                              "\"telefono\":\"4644-4444\",\"fechaDeNacimiento\":\"1989-02-25T02:00:00Z\"," +
                              "\"authToken\":\"#{usuario.authentication_token}\"," +
                              "\"bloqueado\":false,\"direcciones\":[]}"
    end
  end
end