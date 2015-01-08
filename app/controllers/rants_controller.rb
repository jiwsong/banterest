class RantsController < ApplicationController
  before_action :set_rant, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @rants = Rant.all
    respond_with(@rants)
  end

  def show
    respond_with(@rant)
  end

  def new
    @rant = Rant.new
    respond_with(@rant)
  end

  def edit
  end

  def create
    @rant = Rant.new(rant_params)
    @rant.save
    respond_with(@rant)
  end

  def update
    @rant.update(rant_params)
    respond_with(@rant)
  end

  def destroy
    @rant.destroy
    respond_with(@rant)
  end

  private
    def set_rant
      @rant = Rant.find(params[:id])
    end

    def rant_params
      params.require(:rant).permit(:description)
    end
end
