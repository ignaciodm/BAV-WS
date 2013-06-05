require 'spec_helper'

describe Provincia do
  describe 'Unique Index on nombre' do
    context 'when trying to create two provincias with the same nombre' do
      it 'should raise' do
        @provincia = Provincia.create(nombre: 'Buenos Aires')
        lambda { @provincia = Provincia.create(nombre: 'Buenos Aires') }.should raise_error(ActiveRecord::RecordNotUnique)
      end
    end
  end
end