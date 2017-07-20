class Thing::Create < Trailblazer::Operation
  step Model(Thing, :new)
  step :persist!

  def persist!(options, params:, model:, **)
    model.update_attributes(params[:thing])
    model.save
  end
end
