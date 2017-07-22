class CommentsController < ApplicationController
  def create
    run Comment::Create do |result|
      flash[:notice] = "Created comment for \"#{result['model'].thing.name}\""
      return redirect_to thing_path(result['model'].thing)
    end
    render :new
  end

  def new
    run Comment::Create::Present
    @form.prepopulate! # dont work prepopulate without it
  end
end
