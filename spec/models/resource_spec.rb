require 'rails_helper'

describe Resource do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :project }
  end
end
