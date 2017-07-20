require 'rails_helper'

RSpec.describe Thing::Update do
  describe 'with valid params' do
    let(:thing) { Thing::Create.(thing:
        { name: 'Rails', description: 'Kickass web dev' }
      )['model'] }
    let(:params) { { id: thing.id, thing: { name: 'Lotus', description: 'Updated description' } } }

    subject { Thing::Update.(params) }

    it { expect{ subject }.to_not change{ thing.reload.name } }
    it { expect{ subject }.to change{ thing.reload.description }.to(params[:thing][:description]) }
  end

  describe 'with invalid params' do
    let(:thing) { Thing::Create.(thing:
        { name: 'Rails', description: 'Kickass web dev' }
      )['model'] }
    let(:params) { { id: thing.id, thing: { name: 'Lotus', description: 'Q' } } }

    subject { Thing::Update.(params) }

    it { expect{ subject }.to_not change{ thing.reload.name } }
    it { expect{ subject }.to_not change{ thing.reload.description } }
  end
end
