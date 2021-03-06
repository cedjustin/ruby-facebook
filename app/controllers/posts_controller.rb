class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all.order("created_at DESC")
    @users = User.all
  end


  def show
    @users = User.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
      current_user = @current_user
    else
      @post = Post.new
      current_user = @current_user
    end
  end


  def edit
  end



  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end


  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :image, :user_id, :image_cache)
  end
end
