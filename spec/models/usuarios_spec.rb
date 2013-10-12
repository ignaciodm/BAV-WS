require 'spec_helper'

describe Usuario do

  describe 'Validations' do

    before(:each) do
      @comisaria = Comisaria.create({nombre: 'Comisaria 44', calle: 'calle', numero: 10, telefono: '4643-1282'})
      @direccion = Direccion.new({descripcion: 'mi casa', calle: 'calle', numero: 10, localidad_id: 1, comisaria_id: @comisaria.id})
      @another_direccion = Direccion.new({descripcion: 'mi casa 2', calle: 'calle', numero: 10, localidad_id: 1, comisaria_id: @comisaria.id})
      @usuario = Usuario.create!({nombre: 'Ignacio',
                                  apellido: 'De Maio',
                                  dni: '34108888',
                                  email: 'ignaciodemaio@gmail.com',
                                  password: 'nacho123',
                                  password_confirmation: 'nacho123',
                                  telefono: '4644-4444',
                                  fecha_de_nacimiento: Date.new(1989, 02, 25),
                                  direcciones: [@direccion, @another_direccion]})
    end

    def update(h)
      h.each {|k,v| @usuario.send("#{k.to_s}=", v)}
      @usuario.save
    end

    describe 'Un Usuario' do
      it 'should be created with all attributes' do
        @usuario.direcciones.first.descripcion.should == 'mi casa'
        @usuario.direcciones.first.usuario.should == @usuario
        @usuario.direcciones.last.descripcion.should == 'mi casa 2'
      end
    end

    describe 'nombre' do
      context 'when nombre is nil' do
        it 'should not save' do
          update({nombre: nil})
          @usuario.errors[:nombre].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when nombre is empty' do
        it 'should not save' do
          update({nombre: ''})
          @usuario.errors[:nombre].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when nombre is valid' do
        it 'should save' do
          update({nombre: 'Ignacio'})
          @usuario.errors.empty?.should == true
        end
      end
    end

    describe 'apellido' do
      context 'when apellido is nil' do
        it 'should not save' do
          update({apellido: nil})
          @usuario.errors[:apellido].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when apellido is empty' do
        it 'should not save' do
          update({apellido: ''})
          @usuario.errors[:apellido].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when apellido is valid' do
        it 'should save' do
          update({apellido: 'De Maio'})
          @usuario.errors.empty?.should == true
        end
      end
    end

    describe 'dni' do
      context 'when dni is nil' do
        it 'should not save' do
          update({dni: nil})
          @usuario.errors[:dni].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when dni is empty' do
        it 'should not save' do
          update({dni: ''})
          @usuario.errors[:dni].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when dni is valid' do
        it 'should save' do
          update({dni: '34108888'})
          @usuario.errors.empty?.should == true
        end
      end
    end

  end

end