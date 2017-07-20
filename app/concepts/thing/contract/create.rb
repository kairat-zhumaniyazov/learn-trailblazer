module Thing::Contract
  class Create < Reform::Form
    include Reform::Form::ActiveModel::ModelReflections

    property :name
    property :description

    validates :name, presence: true
    validates :description, length: { in: 4..160 }, allow_blank: true
  end
end
