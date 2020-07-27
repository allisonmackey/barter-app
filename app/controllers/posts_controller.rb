class PostsController < ApplicationController 
  def home
    @posts = Post.all
  end

  def index 
    @user = current_user
    @posts = @user.posts
  end

  def new
    @post= Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
   @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else 
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render :index
  end

  private 
    def post_params
      params.require(:post).permit(:title, :body, :author, :icon, :open, :offer, :offer_type, :zipcode)
    end
end