class ThingsController < ApplicationController
  def index
  end

  def create
    # run Thing::Create do |op|
    #   return redirect_to op.model
    # end
    #
    # render action: :new

    run Thing::Create do |result|
      return redirect_to thing_path(result['model'].id)
    end
    render :new
  end

  def new
    # @form = Thing::Contract::Create.new(Thing.new)
    run Thing::Create::Present
  end

  def show
    #code
  end
end
