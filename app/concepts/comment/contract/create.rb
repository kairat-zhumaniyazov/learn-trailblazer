module Comment::Contract
  class Create < Reform::Form
    include Reform::Form::ActiveModel::ModelReflections

    property :body
    property :weight
    property :thing

    validates :body, length: { in: 6..160 }
    validates :weight, inclusion: { in: [0, 1] }
    validates :thing, :user, presence: true

    property :user, prepopulator: ->(*) { self.user = User.new } do
      property :email
    end
  end
end
