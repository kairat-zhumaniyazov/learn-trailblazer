require 'rails_helper'

RSpec.describe Thing::Create do
  let(:user) { create :user }
  let(:thing) { Thing::Create.(thing:
      { name: 'Rails', description: 'Kickass web dev' }
    )['model'] }

  describe 'with valid params' do
    let(:result) { Comment::Create.(
      { comment: { body: 'Comment body', weight: 1 } },
      { thing_id: thing.id, user_id: user.id }
    ) }

    it { expect(result.success?).to be true }
    it { expect(result['model'].persisted?).to be true }
    it { expect(result['model'].body).to eq 'Comment body' }
    it { expect{ result }.to change(user.comments, :count).by(1) }
    it { expect{ result }.to change(thing.comments, :count).by(1) }
  end

  describe 'with invalid params' do
    let(:result) { Comment::Create.(
      { comment: { body: 'qwert'} },
      { thing_id: thing.id, user_id: user.id }
    ) }

    it { expect(result.success?).to be false }
    it { expect(result['model'].persisted?).to be false }
    it { expect{ result }.to_not change(user.comments, :count) }
    it { expect{ result }.to_not change(thing.comments, :count) }
  end
end
