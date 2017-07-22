require 'rails_helper'

RSpec.describe Comment::Create do
  let!(:thing) { Thing::Create.(thing:
      { name: 'Rails', description: 'Kickass web dev' }
    )['model'] }

  let(:model) { result['model'] }

  describe 'with valid params' do
    let(:result) { Comment::Create.(
      {
        comment: {
          body: 'Comment body',
          weight: '1',
          user: { email: 'example@email.com' }
        },
        thing_id: thing.id
      }
    ) }


    it { expect(result.success?).to be true }
    it { expect(model.persisted?).to be true }
    it { expect(model.body).to eq 'Comment body' }

    it { expect(model.user.persisted?).to be true }
    it { expect(model.user.email).to eq 'example@email.com' }

    it { expect{ result }.to change(thing.comments, :count).by(1) }
  end

  describe 'with invalid params' do
    let(:result) { Comment::Create.(
      {
        comment: {
          body: 'body',
          weight: '1',
          user: { email: '' }
        },
        thing_id: thing.id
      }
    ) }

    let(:result_errors) { result['contract.default'].errors.messages }

    it { expect(result.success?).to be false }
    it { expect(model.persisted?).to be false }
    it { expect{ result }.to_not change(thing.comments, :count) }
    it { expect(result_errors[:body]).to eq ["is too short (minimum is 6 characters)"] }
    it { expect(result_errors[:'user.email']).to eq ["can't be blank"] }
  end
end
