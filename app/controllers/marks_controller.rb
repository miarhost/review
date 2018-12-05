class MarksController < ApplicationController
  before_action :set_mark, only: [:show, :update, :destroy]

  # GET /marks
  def index
    @marks = Mark.all

    render json: @marks
  end

  # GET /marks/1
  def show
    render json: @mark
  end

  # POST /marks
  def create
    @mark = Mark.new(value: mark_params[:value], post_id: mark_params[:post_id])
    if @mark.save
      render json: @mark, status: :created, location: @mark
    else
      render json: @mark.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /marks/1
  def update
    if @mark.update(mark_params)
      render json: @mark
    else
      render json: @mark.errors, status: :unprocessable_entity
    end
  end

  # DELETE /marks/1
  def destroy
    @mark.destroy
  end

  def rating
    @rating = (Mark.all.inject(0, :+))/2
    render json: @rating
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mark
      @mark = Mark.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mark_params
      params.require(:mark).permit(:value, :post_id)
    end
end
