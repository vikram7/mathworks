require 'rails_helper'

describe Source do

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:courses) }
  end

end
