require 'spec_helper'

describe Direccion do

  describe 'Validations' do

    before(:each) do
      @direccion = Direccion.new({descripcion: 'name', calle: 'calle', numero: 10})
    end

    def update(h)
      h.each {|k,v| @direccion.send("#{k.to_s}=", v)}
      @direccion.save
    end

    describe 'name' do
      context 'when name is nil' do
        it 'should not save' do
          update({descripcion: nil})
          @direccion.errors[:descripcion].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when name is empty' do
        it 'should not save' do
          update({descripcion: ''})
          @direccion.errors[:descripcion].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when name is valid' do
        it 'should save' do
          update({descripcion: 'name'})
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
          @direccion.errors[:numero][0].should == "is not a numero"
        end
      end

      context 'when numero is empty' do
        it 'should not save' do
          update({numero: ''})
          @direccion.errors[:numero][0].should == "is not a numero"
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
          @direccion.errors[:piso][0].should == "is not a numero"
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

  end

end