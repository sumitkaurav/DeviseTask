class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      #format.html { redirect_to root_path }
      #format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
    @post.comments.build
    respond_to do |format|
      #format.html { redirect_to root_path }
      #format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    #redirect_to root_path
    respond_to do |format|
      #format.html { redirect_to root_path }
      #format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      #format.html { redirect_to root_path }
      #format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    #redirect_to root_path
    respond_to do |format|
      #format.html { redirect_to root_path }
      #format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      #format.html { redirect_to root_path }
      #format.json { head :no_content }
      format.js   { render :layout => false }
   end
    #redirect_to root_path
  end

  def delete_image
    @post = Post.find(params[:post_id])
    @post.image.purge
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title,:description,:image,comments_attributes: [:body])
  end
end
