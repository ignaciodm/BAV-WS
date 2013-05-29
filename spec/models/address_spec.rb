require 'spec_helper'

describe Address do

  before(:each) do
  end

  describe 'Validations' do

    describe 'name' do
      context 'when name is nil' do
        it 'should not save' do
          address = Address.create({name: nil, street: 'street', number: 10})
          address.errors[:name].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when name is empty' do
        it 'should not save' do
          address = Address.create({name: '', street: 'street', number: 10})
          address.errors[:name].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when name is valid' do
        it 'should save' do
          address = Address.create({name: 'name', street: 'street', number: 10})
          address.errors.empty?.should == true
        end
      end
    end

    describe 'street' do
      context 'when street is nil' do
        it 'should not save' do
          address = Address.create({name: 'name', street: nil, number: 10})
          address.errors[:street].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when street is empty' do
        it 'should not save' do
          address = Address.create({name: 'name', street: '', number: 10})
          address.errors[:street].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when street is valid' do
        it 'should save' do
          address = Address.create({name: 'name', street: 'street', number: 10})
          address.errors.empty?.should == true
        end
      end
    end

    describe 'number' do
      context 'when number is nil' do
        it 'should not save' do
          address = Address.create({name: 'name', street: 'street', number: nil})
          address.errors[:number][0].should == "is not a number"
        end
      end

      context 'when number is empty' do
        it 'should not save' do
          address = Address.create({name: 'name', street: 'street', number: ''})
          address.errors[:number][0].should == "is not a number"
        end
      end

      context 'when number is valid' do
        it 'should save' do
          address = Address.create({name: 'name', street: 'street', number: 10})
          address.errors.empty?.should == true
        end
      end
    end

  end

end