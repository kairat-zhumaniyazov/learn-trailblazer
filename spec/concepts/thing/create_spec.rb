require 'rails_helper'

RSpec.describe Thing::Create do
  describe 'with valid params' do
    let(:model) { Thing::Create.(thing:
        { name: 'Rails', description: 'Kickass web dev' }
      )['model'] }

    it { expect(model.persisted?).to be true }
    it { expect(model.name).to eq 'Rails' }
    it { expect(model.description).to eq 'Kickass web dev' }
  end

  describe 'with invalid params' do
    let(:result) { Thing::Create.(thing:
        { name: '', description: '1' }
      ) }

    it { expect(result.success?).to be false }
    it { expect(result['model'].persisted?).to be false }
    it { expect(result['contract.default'].errors.messages.to_s).to eq "{:name=>[\"can't be blank\"], :description=>[\"is too short (minimum is 4 characters)\"]}" }
  end
end
