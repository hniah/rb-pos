require 'rails_helper'

describe ProjectStep do
  context 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :project }
  end
end
