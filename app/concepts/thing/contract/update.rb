module Thing::Contract
  class Update < Reform::Form
    property :name, writeable: false
    property :description

    validates :description, length: { in: 4..160 }, allow_blank: true
  end
end
