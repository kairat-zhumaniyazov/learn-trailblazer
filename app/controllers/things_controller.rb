class ThingsController < ApplicationController
  def index
  end

  def create
    run Thing::Create do |result|
      return redirect_to result['model']
    end
    render :new
  end

  def new
    run Thing::Create::Present
  end

  def show
  end

  def edit
    run Thing::Update::Present
  end

  def update
    run Thing::Update do |result|
      return redirect_to result['model']
    end
    render :new
  end
end
