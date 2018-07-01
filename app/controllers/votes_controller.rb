# frozen_string_literal: true

class VotesController < OpenReadController
  before_action :set_vote, only: %i[update destroy]

  # GET /votes
  def index
    @votes = Vote.all

    render json: @votes
  end

  # GET /votes/1
  def show
    render json: Vote.find(params[:id])
  end

  # POST /votes
  def create
    @vote = current_user.votes.build(vote_params)

    if @vote.save
      render json: @vote, status: :created, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /votes/1
  def update
    if @vote.update(vote_params)
      render json: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /votes/1
  def destroy
    @vote.destroy

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vote
    @vote = current_user.votes.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def vote_params
    params.require(:vote).permit(:user_id, :discussion_id)
  end
end
