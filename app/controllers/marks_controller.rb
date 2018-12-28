class MarksController < ApplicationController
  before_action :set_mark, only: [:show, :update, :destroy]
  before_action :set_post
  def index
    @marks = Mark.all
    render json: @marks
  end

  def show
    render json: @mark
  end

  def create
    @mark = @post.marks.build(value: mark_params[:value], post_id: mark_params[:post_id])
    if @mark.save
      render json: @mark, status: :created, location: @post.marks
      redirect_to 
    else
      render json: @mark.errors, status: :unprocessable_entity
    end
  end

  def update
    if @mark.update(mark_params)
      render json: @mark
    else
      render json: @mark.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @mark.destroy
  end

  def rating
    @rating = (Mark.all.inject(0, :+))/2
    render json: @rating
  end

  def best
    @best = Mark.all.select.where(rating: (1..10))
    render json: @best
  end

  private
  def set_post
    @post = Post.find(params[:post_id]) 
  end

  def set_mark
    @mark = Mark.find(params[:id])
  end

  def mark_params
    params.require(:mark).permit(:value, :post_id)
  end

end
