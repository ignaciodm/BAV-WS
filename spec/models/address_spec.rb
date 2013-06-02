require 'spec_helper'

describe Address do

  describe 'Validations' do
    address = Address.create({name: nil, street: 'street', number: 10})

    describe 'name' do
      context 'when name is nil' do
        it 'should not save' do
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

    describe 'floor' do
      context 'when floor is nil' do
        it 'should save' do
          address = Address.create({name: 'name', street: 'street', number: 10, floor: nil})
          address.errors.empty?.should == true
        end
      end

      context 'when floor is empty' do
        it 'should not save' do
          address = Address.create({name: 'name', street: 'street', number: 10, floor: ''})
          address.errors.empty?.should == true
        end
      end

      context 'when floor is a number' do
        it 'should save' do
          address = Address.create({name: 'name', street: 'street', number: 10, floor: 1})
          address.errors.empty?.should == true
        end
      end

      context 'when floor is not a number' do
        it 'should save' do
          address = Address.create({name: 'name', street: 'street', number: 10, floor: 'floor'})
          address.errors[:floor][0].should == "is not a number"
        end
      end

      context 'when floor is not an integer' do
        it 'should save' do
          address = Address.create({name: 'name', street: 'street', number: 10, floor: 1.3})
          address.errors[:floor][0].should == "must be an integer"
        end
      end
    end

    describe 'flat' do
      context 'when flat is nil' do
        it 'should save' do
          address = Address.create({name: 'name', street: 'street', number: 10, flat: nil})
          address.errors.empty?.should == true
        end
      end

      context 'when flat is empty' do
        it 'should not save' do
          address = Address.create({name: 'name', street: 'street', number: 10, flat: ''})
          address.errors.empty?.should == true
        end
      end

      context 'when flat is a number' do
        it 'should convert it to integer' do
          address = Address.create({name: 'name', street: 'street', number: 10, flat: 1})
          address.errors.empty?.should == true
        end
      end

      context 'when flat is not valid string' do
        it 'should save' do
          address = Address.create({name: 'name', street: 'street', number: 10, flat: 'H'})
          address.errors.empty?.should == true
        end
      end

      context 'when flat is too long' do
        it 'should save' do
          address = Address.create({name: 'name', street: 'street', number: 10, flat: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'})
          address.errors[:flat].should == ["is too long (maximum is 25 characters)"]
        end
      end

    end

  end

end