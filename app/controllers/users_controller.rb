class UsersController < ApplicationController
  def index
    @user=User.all
    @posts = Post.with_long_title
    @post= Post.new
    @comment = Comment.new
  end

  def edit
  end

  def show
  end

  def update
  end
end
