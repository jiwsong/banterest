class RantsController < ApplicationController
  before_action :set_rant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @rants = Rant.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 8 )
    respond_with(@rants)
  end

  def show
    respond_with(@rant)
  end

  def new
    @rant = current_user.rants.build
    respond_with(@rant)
  end

  def edit
  end

  def create
    @rant = current_user.rants.build(rant_params)
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

    def correct_user
      @rant = current_user.rants.find_by(id: params[:id])
      redirect_to rants_path, notice: "Not authorized to edit this rant" if @rant.nil?
    end

    def rant_params
      params.require(:rant).permit(:description, :image)
    end
end
