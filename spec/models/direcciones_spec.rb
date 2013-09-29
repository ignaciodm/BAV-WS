require 'spec_helper'

describe Direccion do

  describe 'Validations' do

    before(:each) do
      @provincia = Provincia.create(nombre: 'Buenos Aires')
      @partido = Partido.create(nombre: 'San Isidro', provincia_id: @provincia.id)
      @localidad = Localidad.create(nombre: 'Beccar', partido_id: @partido.id)
      @usuario = Usuario.create!({nombre: 'Ignacio',
                                  apellido: 'De Maio',
                                  dni: '34108888',
                                  email: 'ignaciodemaio@gmail.com',
                                  password: 'nacho123',
                                  password_confirmation: 'nacho123'})
      @comisaria = Comisaria.create({nombre: 'Comisaria 44', calle: 'calle', numero: 10, telefono: '4643-1282'})

      @direccion = Direccion.new({descripcion: 'mi casa',
                                  calle: 'calle',
                                  numero: 10,
                                  localidad_id: @localidad.id,
                                  usuario_id: @usuario.id,
                                  comisaria_id: @comisaria.id})
    end

    def update(h)
      h.each {|k,v| @direccion.send("#{k.to_s}=", v)}
      @direccion.save
    end

    describe 'Una direccion' do
      it 'should be created with all attributes' do
        @direccion.localidad.nombre.should == 'Beccar'
        @direccion.partido.nombre == 'San Isidro'
        @direccion.provincia.nombre == 'San Isidro'

      end
    end

    describe 'nombre' do
      context 'when nombre is nil' do
        it 'should not save' do
          update({descripcion: nil})
          @direccion.errors[:descripcion].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when nombre is empty' do
        it 'should not save' do
          update({descripcion: ''})
          @direccion.errors[:descripcion].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when nombre is valid' do
        it 'should save' do
          update({descripcion: 'mi casa'})
          @direccion.errors.empty?.should == true
        end
      end
    end

    describe 'calle' do
      context 'when calle is nil' do
        it 'should not save' do
          update({calle: nil})
          @direccion.errors[:calle].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when calle is empty' do
        it 'should not save' do
          update({calle: ''})
          @direccion.errors[:calle].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when calle is valid' do
        it 'should save' do
          update({descripcion: 'calle'})
          @direccion.errors.empty?.should == true
        end
      end
    end

    describe 'numero' do
      context 'when numero is nil' do
        it 'should not save' do
          update({numero: nil})
          @direccion.errors[:numero][0].should == "is not a number"
        end
      end

      context 'when numero is empty' do
        it 'should not save' do
          update({numero: ''})
          @direccion.errors[:numero][0].should == "is not a number"
        end
      end

      context 'when numero is valid' do
        it 'should save' do
          @direccion.save
          @direccion.errors.empty?.should == true
        end
      end
    end

    describe 'piso' do
      context 'when piso is nil' do
        it 'should save' do
          @direccion.save
          @direccion.errors.empty?.should == true
        end
      end

      context 'when piso is empty' do
        it 'should not save' do
          update({piso: ''})
          @direccion.errors.empty?.should == true
        end
      end

      context 'when piso is a numero' do
        it 'should save' do
          update({piso: 1})
          @direccion.errors.empty?.should == true
        end
      end

      context 'when piso is not a numero' do
        it 'should save' do
          update({piso: 'piso'})
          @direccion.errors[:piso][0].should == "is not a number"
        end
      end

      context 'when piso is not an integer' do
        it 'should save' do
          update({piso: 1.3})
          @direccion.errors[:piso][0].should == "must be an integer"
        end
      end
    end

    describe 'departamento' do
      context 'when departamento is nil' do
        it 'should save' do
          @direccion.save
          @direccion.errors.empty?.should == true
        end
      end

      context 'when departamento is empty' do
        it 'should not save' do
          update({departamento: ''})
          @direccion.errors.empty?.should == true
        end
      end

      context 'when departamento is a numero' do
        it 'should convert it to integer' do
          update({departamento: 1})
          @direccion.errors.empty?.should == true
        end
      end

      context 'when departamento is not valid string' do
        it 'should save' do
          update({departamento: 'H'})
          @direccion.errors.empty?.should == true
        end
      end

      context 'when departamento is too long' do
        it 'should save' do
          update({departamento: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'})
          @direccion.errors[:departamento].should == ["is too long (maximum is 25 characters)"]
        end
      end

    end

    describe 'localidad' do
      context 'when localidad is nil' do
        it 'should not save' do
          update({localidad_id: nil})
          @direccion.errors[:localidad_id].should == ["can't be blank"]
        end
      end

      context 'when localidad is valid' do
        it 'should save' do
          update({localidad_id: @localidad.id})
          @direccion.errors.empty?.should == true
        end
      end
    end

  end

end