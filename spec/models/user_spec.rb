require 'spec_helper'

describe User do
  PublicActivity.enabled = false
  let(:new_user) { FactoryGirl.create(:user) } # What does this do?

  context 'when validating' do
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

  context 'when searching' do
    it 'finds users by role' do
      user1 = FactoryGirl.create(:user, role: 'hacker')
      user2 = FactoryGirl.create(:user, role: 'artist')

      expect(User.search('is:hacker')).to eq([user1])
      expect(User.search('is:developer')).to eq([])
    end

    it 'finds users by hirability' do
      user1 = FactoryGirl.create(:user, available_for_hire: true)
      user2 = FactoryGirl.create(:user, available_for_hire: false)

      expect(User.search('is:forhire')).to eq([user1])
    end

    it 'finds users by bio keywords' do
      user1 = FactoryGirl.create(:user, bio: 'these are just keywords.')
      user2 = FactoryGirl.create(:user, bio: 'these are just more keywords.')

      expect(User.search('these are just')).to eq([user1, user2])
      expect(User.search('more')).to eq([user2])
    end

    it 'finds users by role, hirability, and bio keywords' do
      user1 = FactoryGirl.create(:user, available_for_hire: true, role: 'hacker', bio: 'more keywords for me.')
      user2 = FactoryGirl.create(:user, available_for_hire: false, role: 'artist', bio: 'more keywords for me and you.')
      user3 = FactoryGirl.create(:user, available_for_hire: false, role: 'artist', bio: 'less keywords please')
      user4 = FactoryGirl.create(:user, available_for_hire: true, role: 'business', bio: 'mas keywords!')

      expect(User.search('is:artist keywords')).to eq([user2, user3])
      expect(User.search('is:artist is:forhire')).to eq([])
      expect(User.search('keywords is:forhire')).to eq([user1, user4])
    end
  end
end