require 'rspec'

describe UsuariosController do
  render_views

  describe "create" do

    it "assigns @teams" do
      post :create, {:format => 'json',
                     usuario: {
          nombre: 'nacho',
          apellido: 'de maio',
          email: 'ignaciodemaio@gmail.com',
          password: 'nacho123',
          telefono: '4644-4444',
          fecha_de_nacimiento: Date.new(1989, 02, 25),
          dni: '34108898'}
      }
      expect(response).to render_template('usuarios/mailer/confirmation_instructions')
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
                              "\"telefono\":\"4644-4444\",\"fecha_de_nacimiento\":\"1989-02-25T02:00:00Z\"," +
                              "\"authentication_token\":\"#{usuario.authentication_token}\"," +
                              "\"failed_attempts\":0,\"access_locked?\":false,\"direcciones\":[]}"
    end
  end
end