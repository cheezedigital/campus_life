require 'rails_helper'

RSpec.describe Note, :type => :model do

  describe 'validations', :focus do
    it { should validate_presence_of :text }
  end
  
end
