class Thing::Update < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Thing, :find_by)
    step Contract::Build( constant: Thing::Contract::Update )
  end

  step Nested( Present )
  step Contract::Validate( key: :thing )
  step Contract::Persist()
end
