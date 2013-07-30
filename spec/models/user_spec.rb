require 'spec_helper'

describe User do
  let(:new_user) { FactoryGirl.create(:user) }

  context 'Validation' do
    it 'fails without a fullname' do
      user = FactoryGirl.build(:user, first_name: '', last_name: '')

      expect(user).not_to be_valid
      expect(user).to have(1).error_on(:full_name)
    end

    it 'fails without an username' do
      user = FactoryGirl.build(:user, username: '')

      expect(user).not_to be_valid
      expect(user).to have(1).error_on(:username)
    end

    it 'fails without an unique username' do
      user  = FactoryGirl.create(:user, username: 'coderat')
      user2 = FactoryGirl.build(:user, username: 'coderat')

      expect(user).to be_valid
      expect(user2).not_to be_valid
      expect(user2).to have(1).error_on(:username)
    end

    it 'fails when bio is greater than 120 characters' do
      user = FactoryGirl.build(:user, bio: Kernel.rand(125**120))

      expect(user).not_to be_valid
      expect(user).to have(1).error_on(:bio)
    end
  end
end