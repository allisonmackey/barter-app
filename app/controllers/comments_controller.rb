class CommentsController < ApplicationController 
  before_action :authenticate_user!, :except => [:index]
  def index 
    redirect_to home_path
  end

  def new
    @post = Post.find(params[:post_id])
    @comment= Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to home_path
    else
      render :new
    end
  end

  def edit
   @post = Post.find(params[:post_id])
   @comment = Comment.find(params[:id])
  end

  def show
   @post = Post.find(params[:post_id])
   @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to posts_path
    else 
      render :edit
    end
  end

  def destroy
    @comment= Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  private 
    def comment_params
      params.require(:comment).permit(:author, :body, :offer, :offer_type)
    end
end