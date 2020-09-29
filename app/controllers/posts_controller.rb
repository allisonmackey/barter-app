class PostsController < ApplicationController 
  before_action :authenticate_user!, :except => [:home]

  def home
    if current_user
      @user = current_user.id
    end

    if params[:search_term]
      @search_params = params[:search_term]
      @posts = Post.search_posts(params[:search_term])
    else
      @search_params = nil
      @posts = Post.all.newest_oldest.where("user_id != #{@user}")
    end
    # CAUSING SEARCH FUNCTION TO NOT WORK PROPERLY 
    # if params[:sort] == "ascending"
    #   @posts = Post.oldest_newest.where("user_id != #{@user}")
    # elsif params[:sort] == "descending"
    #   @posts = Post.all.where("user_id != #{@user}")
    # else
    #   @posts = Post.all.where("user_id != #{@user}")
    # end
    #   
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