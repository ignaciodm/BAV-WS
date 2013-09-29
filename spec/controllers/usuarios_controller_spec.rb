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
                          dni: '34108898'})

      post :login, {:format => 'json', email: usuario.email, password: usuario.password }
      response.status.should == 200
      response.body.should == "{\"id\":2,\"nombre\":\"nacho\",\"apellido\":\"de maio\",\"direcciones\":[]}"
    end
  end
end