class PostsController < ApplicationController
  def top
  end
  def new
    @post = Post.new
  end
end
