class ClikesController < ApplicationController
	before_action :find_comment
	before_action :find_like, only: [:destroy]
	before_action :find_post

	def create
		if already_liked?
	     flash[:notice] = "You can't like more than once"
	    else
	     @comment.clikes.create(user_id: current_user.id)
	    end
		redirect_to post_path(@post.id)
	end

	def destroy
	  if !(already_liked?)
	    flash[:notice] = "Cannot unlike"
	  else
	    @like.destroy
	  end
	  redirect_to post_path(@post.id)
	end

	private
	  def find_comment
	    @comment = Comment.find(params[:comment_id])
	  end

	  def find_post
	    @post = Post.find(params[:post_id])
	  end

	  def already_liked?
	    Clike.where(user_id: current_user.id, comment_id:
	    params[:comment_id]).exists?
	  end

	  def find_like
	   @like = @comment.clikes.find(params[:id])
	  end
end
