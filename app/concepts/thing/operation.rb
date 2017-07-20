class Thing < ApplicationRecord
  class Create < Tralblazer::Operation
    def process(params)
      @model = Thing.create(params[:thing])
    end
  end
end
