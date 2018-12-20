class LpController < ApplicationController
  def show
    @lp = Lp.find(params[:id])
  end

  def new
    @lp = Lp.new
  end

  def create
    lp = Lp.new(lp_params)
    if lp.save
      redirect_to(crontroller: 'artist', action: 'show' , id: Artist.find(params[:artist_id]))
    else
      redirect_to(action: 'new')
    end
  end

  def edit
    @lp = Lp.find(params[:id])
  end

  def update
    lp = Lp.find(params[:id])
    lp.update(lp_params)
    redirect_to(lp: 'show', id: lp.id)
  end

  def delete
    lp = Lp.find(params[:id])
    lp.destroy
    redirect_to root_path
  end

  private
    def lp_params
      params.require(:lp).permit(:name, :description, :url, :artist_id)
    end
end
