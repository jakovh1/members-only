class PostsController < ApplicationController
  before_action :require_login, only: [ :new, :create, :update ]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def require_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def post_params
    params.expect(post: [ :title, :content ])
  end
end
