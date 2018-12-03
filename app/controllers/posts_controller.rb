class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    response = PostCreationService.new(user, post_params[:content]).execute
    response.apply(self)
    @post.author_ip = request.remote_ip
    if @post.save
      render json: @post, status: 200, location: @post
    else
      render json: @post.errors, status: 422
    end
    
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end

  private
   
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :author_ip, :user_id)
    end
end
