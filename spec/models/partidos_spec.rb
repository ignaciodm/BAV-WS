require 'spec_helper'

describe Partido do
  describe 'database indexes' do

    before(:each)  do
      @provincia = Provincia.create(nombre: 'Buenos Aires')
      @partido = Partido.create!(nombre: 'San Isidro', provincia_id: @provincia.id)
    end

    context 'when trying to create two partidos with the same provincia' do
      it 'should raise' do
        lambda { @partido = Partido.create!(nombre: 'San Isidro', provincia_id: @provincia.id) }.should raise_error(ActiveRecord::RecordNotUnique)
      end
    end

    context 'when trying to create two partidos with the same nombre but in different provincias' do
      it 'should raise' do
        another_provincia = Provincia.create(nombre: 'Santa Fe')
        lambda {Partido.create!(nombre: 'San Isidro', provincia_id: another_provincia.id)}.should_not raise_error
      end
    end
  end
end