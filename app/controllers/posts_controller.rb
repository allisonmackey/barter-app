class PostsController < ApplicationController 
  before_action :authenticate_user!, :except => [:index]

  def home
    if current_user
      @user = current_user.id
    end
    if params[:search_term]
      @posts = Post.search_posts(params[:search_term])
    else 
      @posts = Post.all.where("user_id != #{@user}")
    end
    # binding.pry
  end

  # Accessing Active Storage Records for other users to display profile photos in comments : @image = ActiveStorage::Attachment.where()"@record.user_id = 6" --> allows you to get assignment from active storage... 

  def index 
    @user = current_user
    if params[:search_term]
      @posts = Post.search_posts(params[:search_term])
    else
      @posts = @user.posts
    end
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
  #  @post = Post.find(params[:id])
  #  binding.pry
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
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private 
    def post_params
      params.require(:post).permit(:title, :body, :author, :icon, :open, :offer, :offer_type, :zipcode)
    end
end