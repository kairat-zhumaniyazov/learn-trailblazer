require 'rails_helper'

RSpec.describe Thing::Create do
  let(:model) { Thing::Create.(thing:
      { name: 'Rails', description: 'Kickass web dev' }
    )['model'] }

  it { expect(model.persisted?).to be true }
  it { expect(model.name).to eq 'Rails' }
  it { expect(model.description).to eq 'Kickass web dev' }
end
