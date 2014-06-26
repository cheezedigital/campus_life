require 'rails_helper'

RSpec.describe Assignment, :type => :model do

  describe 'associations' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of :text }
  end

  describe '#incomplete?' do
    before do
      @assignment = create(:assignment)
    end
    it 'returns true for when complete is false' do
      expect(@assignment).to be_incomplete
    end
  end
end
