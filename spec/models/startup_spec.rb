require 'spec_helper'

describe Startup do
  let(:new_startup) { FactoryGirl.create(:startup) }

  context 'Validation' do
    it 'fails without a name' do
      startup = FactoryGirl.build(:startup, name: '')

      expect(startup).not_to be_valid
      expect(startup).to have(1).error_on(:name)
    end

    it 'fails without a pitch' do
      startup = FactoryGirl.build(:startup, pitch: '')

      expect(startup).not_to be_valid
      expect(startup).to have(1).error_on(:pitch)
    end

    it 'fails when pitch is greater than 100 characters' do
      startup = FactoryGirl.build(:startup, pitch: Kernel.rand(100**120))

      expect(startup).not_to be_valid
      expect(startup).to have(1).error_on(:pitch)
    end

    it 'fails when name is greater than 40 characters' do
      startup = FactoryGirl.build(:startup, name: Kernel.rand(20**40))

      expect(startup).not_to be_valid
      expect(startup).to have(1).error_on(:name)
    end
  end
end