class ThingsController < ApplicationController
  def index
  end

  def create
    run Thing::Create
  end
end
