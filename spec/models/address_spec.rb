require 'spec_helper'

describe Address do

  describe 'Validations' do

    before(:each) do
      @address = Address.new({name: 'name', street: 'street', number: 10})
    end

    def update(h)
      h.each {|k,v| @address.send("#{k.to_s}=", v)}
      @address.save
    end

    describe 'name' do
      context 'when name is nil' do
        it 'should not save' do
          update({name: nil})
          @address.errors[:name].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when name is empty' do
        it 'should not save' do
          update({name: ''})
          @address.errors[:name].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when name is valid' do
        it 'should save' do
          update({name: 'name'})
          @address.errors.empty?.should == true
        end
      end
    end

    describe 'street' do
      context 'when street is nil' do
        it 'should not save' do
          update({street: nil})
          @address.errors[:street].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when street is empty' do
        it 'should not save' do
          update({street: ''})
          @address.errors[:street].should == ["can't be blank", "is too short (minimum is 2 characters)"]
        end
      end

      context 'when street is valid' do
        it 'should save' do
          update({name: 'street'})
          @address.errors.empty?.should == true
        end
      end
    end

    describe 'number' do
      context 'when number is nil' do
        it 'should not save' do
          update({number: nil})
          @address.errors[:number][0].should == "is not a number"
        end
      end

      context 'when number is empty' do
        it 'should not save' do
          update({number: ''})
          @address.errors[:number][0].should == "is not a number"
        end
      end

      context 'when number is valid' do
        it 'should save' do
          @address.save
          @address.errors.empty?.should == true
        end
      end
    end

    describe 'floor' do
      context 'when floor is nil' do
        it 'should save' do
          @address.save
          @address.errors.empty?.should == true
        end
      end

      context 'when floor is empty' do
        it 'should not save' do
          update({floor: ''})
          @address.errors.empty?.should == true
        end
      end

      context 'when floor is a number' do
        it 'should save' do
          update({floor: 1})
          @address.errors.empty?.should == true
        end
      end

      context 'when floor is not a number' do
        it 'should save' do
          update({floor: 'floor'})
          @address.errors[:floor][0].should == "is not a number"
        end
      end

      context 'when floor is not an integer' do
        it 'should save' do
          update({floor: 1.3})
          @address.errors[:floor][0].should == "must be an integer"
        end
      end
    end

    describe 'flat' do
      context 'when flat is nil' do
        it 'should save' do
          @address.save
          @address.errors.empty?.should == true
        end
      end

      context 'when flat is empty' do
        it 'should not save' do
          update({flat: ''})
          @address.errors.empty?.should == true
        end
      end

      context 'when flat is a number' do
        it 'should convert it to integer' do
          update({flat: 1})
          @address.errors.empty?.should == true
        end
      end

      context 'when flat is not valid string' do
        it 'should save' do
          update({flat: 'H'})
          @address.errors.empty?.should == true
        end
      end

      context 'when flat is too long' do
        it 'should save' do
          update({flat: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'})
          @address.errors[:flat].should == ["is too long (maximum is 25 characters)"]
        end
      end

    end

  end

end