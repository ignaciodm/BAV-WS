require 'spec_helper'

describe Address do

  before(:each) do
  end

  describe 'Validations' do

    describe 'name' do
      context 'when name is nil' do
        it 'should not save' do
          address = Address.create({name: nil})
          address.errors[:name][0].should == "can't be blank"
          address.errors[:name][1].should == "is too short (minimum is 2 characters)"
        end
      end

      context 'when name is empty' do
        it 'should not save' do
          address = Address.create({name: ''})
          address.errors[:name][0].should == "can't be blank"
          address.errors[:name][1].should == "is too short (minimum is 2 characters)"
        end
      end

      context 'when name is empty' do
        it 'should save' do
          address = Address.create({name: 'valid name'})
          address.errors.empty?.should == true
        end
      end
    end

  end

end