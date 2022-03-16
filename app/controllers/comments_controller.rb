class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    #@post = Post.find(params[:post_id])
    @comment = Comment.new
    respond_to do |format|
      #format.html
      format.js  { render :layout => false }
    end
  end

  def create
    @post = Post.find(params[:comment][:post_id])
    @post.comments.create(comment_params)
    
    respond_to do |format|
      #format.html { redirect_to root_path }
      #format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def edit
  end

  def delete
  end

  private
  def comment_params
    params.require(:comment).permit(:body,:post_id)
  end
end
