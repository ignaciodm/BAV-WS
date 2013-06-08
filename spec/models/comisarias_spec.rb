require 'spec_helper'

describe Comisaria do

  describe 'Validations' do

    before(:each) do
      @provincia = Provincia.create(nombre: 'Buenos Aires')
      @partido = Partido.create(nombre: 'San Isidro', provincia_id: @provincia)
      @localidad = Localidad.create(nombre: 'Beccar', partido_id: @partido)
      @comisaria = Comisaria.new({nombre: 'Comisaria 44', calle: 'calle', numero: 10, telefono: '4643-1282'})
    end

    def update(h)
      h.each {|k,v| @comisaria.send("#{k.to_s}=", v)}
      @comisaria.save
    end

    #describe 'Una Comisaria' do
    #  it 'should be created with all attributes' do
    #    @comisaria.localidad.nombre.should == 'Beccar'
    #    @comisaria.localidad.partido.nombre == 'San Isidro'
    #    @comisaria.localidad.partido.provincia.nombre == 'San Isidro'
    #
    #  end
    #end

    describe 'nombre' do
      context 'when nombre is nil' do
        it 'should not save' do
          update({nombre: nil})
          @comisaria.errors[:nombre].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when nombre is empty' do
        it 'should not save' do
          update({nombre: ''})
          @comisaria.errors[:nombre].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when nombre is valid' do
        it 'should save' do
          update({nombre: 'mi casa'})
          @comisaria.errors.empty?.should == true
        end
      end
    end

    describe 'calle' do
      context 'when calle is nil' do
        it 'should not save' do
          update({calle: nil})
          @comisaria.errors[:calle].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when calle is empty' do
        it 'should not save' do
          update({calle: ''})
          @comisaria.errors[:calle].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when calle is valid' do
        it 'should save' do
          update({calle: 'calle'})
          @comisaria.errors.empty?.should == true
        end
      end
    end

    describe 'numero' do
      context 'when numero is nil' do
        it 'should not save' do
          update({numero: nil})
          @comisaria.errors[:numero][0].should == "is not a number"
        end
      end

      context 'when numero is empty' do
        it 'should not save' do
          update({numero: ''})
          @comisaria.errors[:numero][0].should == "is not a number"
        end
      end

      context 'when numero is valid' do
        it 'should save' do
          @comisaria.save
          @comisaria.errors.empty?.should == true
        end
      end
    end

  end

end