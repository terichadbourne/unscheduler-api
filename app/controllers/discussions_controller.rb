# frozen_string_literal: true

class DiscussionsController < OpenReadController
  before_action :set_discussion, only: %i[update destroy]

  # GET /discussions
  def index
    @discussions = Discussion.all

    render json: @discussions
  end

  # GET /discussions/1
  def show
    render json: Discussion.find(params[:id])
  end

  # POST /discussions
  def create
    @discussion = current_user.discussions_proposed.build(discussion_params)

    if @discussion.save
      render json: @discussion, status: :created, location: @discussion
    else
      render json: @discussion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /discussions/1
  def update
    if @discussion.update(discussion_params)
      render json: @discussion
    else
      render json: @discussion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /discussions/1
  def destroy
    @discussion.destroy

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_discussion
    @discussion = current_user.discussions_proposed.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def discussion_params
    params.require(:discussion).permit(:title, :winner, :user_id)
  end
end
