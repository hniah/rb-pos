require 'rails_helper'

describe Project do
  context 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :category_id }
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :cost }
    it { is_expected.to validate_presence_of :time }
    it { is_expected.to validate_numericality_of(:cost).only_integer }
  end
end
