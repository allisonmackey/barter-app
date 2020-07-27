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
    @current_user = current_user
    @post = @current_user.posts.new(post_params)
    # to determine icon type
    if @post.offer_type == "service" 
      @post.icon = "services.png"
    else 
      @post.icon = "goods.png"
    end
      # binding.pry
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
   binding.pry
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