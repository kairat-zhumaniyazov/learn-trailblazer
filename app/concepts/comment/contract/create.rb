module Comment::Contract
  class Create < Reform::Form
    include Reform::Form::ActiveRecord

    property :body
    property :weight, prepopulator: ->(*) { self.weight = 0 }
    property :thing

    validates :body, length: { in: 6..160 }
    validates :weight, inclusion: { in: ['0', '1'] }
    validates :thing, :user, presence: true

    property :user,
      prepopulator:      ->(*) { self.user = User.new },
      populate_if_empty: ->(*) { User.new } do
        property :email
        validates :email, presence: true
    end
  end
end
