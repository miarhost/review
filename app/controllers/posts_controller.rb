class PostsController < ApplicationController


  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    render json: @post
  end

  def create
  @post = Post.new(title: post_params[:title], content: post_params[:content], author_ip: post_params[:author_ip], user_id: post_params[:user_id])
  @post.user_id = @post.user.id
   @post.author_ip = request.remote_ip
    if @post.save
      render json: @post, status: 200, location: @posts
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

  def post_params
   params.require(:post).permit(:title, :content, :author_ip, :user_id)
  end

end
