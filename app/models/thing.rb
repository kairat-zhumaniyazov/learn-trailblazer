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

class Thing < ApplicationRecord
  has_many :comments, dependent: :destroy

  scope :latest, -> { limit(9) }
end
