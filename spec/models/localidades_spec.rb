require 'spec_helper'

describe Localidad do
  describe 'Unique Index on nombre y partido_id' do
    before(:each) do
      @provincia = Provincia.create(nombre: 'Buenos Aires')
      @partido = Partido.create!(nombre: 'San Isidro', provincia_id: @provincia.id)
      @localidad = Localidad.create!(nombre: 'Beccar', partido_id: @partido.id)
    end

    context 'when trying to create two localidades with the same partido' do
      it 'should raise' do
        lambda { @localidad = Localidad.create!(nombre: 'Beccar', partido_id: @partido.id) }.should raise_error(ActiveRecord::RecordNotUnique)
      end
    end

    context 'when trying to create two localidades with the same nombre but in different partidos' do
      it 'should be two localidades with the same nombre' do
        another_partido = Partido.create(nombre: 'La Matanza', provincia_id: @provincia.id)
        Localidad.create(nombre: 'Beccar', partido_id: another_partido.id)
        Localidad.find_all_by_nombre('Beccar').size.should == 2
      end
    end
  end
end