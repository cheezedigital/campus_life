require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'associations' do
    it { should have_many :assigments }
  end

  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end

  describe '.by_first_name' do
    before do
      create(:user, first_name: 'Justin', last_name: 'Veirs')
      create(:user, first_name: 'Justin', last_name: 'Ruiz')
      create(:user, first_name: 'Landon', last_name: 'West')
    end
    it 'returns 2 users' do
      expect(User.by_first_name('Justin').count).to eq 2
    end
    it 'does not include landon' do
      expect(User.by_first_name('Justin').collect(&:first_name)).to_not include 'Landon'
    end
  end

  describe '#name' do
    before do
      @user = create(:user, first_name: 'Bill', last_name: 'Rogers')
    end
    it 'returns Bill Rogers' do
      expect(@user.name).to eq 'Bill Rogers'
    end
  end

  describe '#age' do
    before do
      Timecop.freeze(Time.local(2014))
      @user = create(:user, birthday: '1990-01-01')
    end
    after do
      Timecop.return
    end
    it 'returns 24' do
      expect(@user.age).to eq 24
    end
  end

  describe '#inactive?' do
    before do
      @user = create(:user, active: false)
    end
    it 'returns true for when active is false' do
      expect(@user).to be_inactive
    end
  end

end
