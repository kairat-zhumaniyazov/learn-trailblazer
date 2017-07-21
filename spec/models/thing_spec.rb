# == Schema Information
#
# Table name: things
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Thing, type: :model do
  it { should have_many(:comments).dependent(:destroy) }
end
