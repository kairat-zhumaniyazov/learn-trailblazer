class CommentsController < ApplicationController
  def create
    run Comment::Create
  end

  def new
    run Comment::Create::Present
  end
end
