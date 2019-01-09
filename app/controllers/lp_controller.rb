class LpController < ApplicationController
  def show
    if !params[:search].nil?
        redirect_to(controller: 'pages', action: 'home', search: params[:search])
    else
      @lp = Lp.find(params[:id])
    end
  end

  def new
    @lp = Lp.new
  end

  def create
    lp = Lp.new(lp_params)
    Artist.find(lp_params[:artist_id]).lps << lp
    if lp.save
      redirect_to(action: 'show' , id: lp.id)
    else
      redirect_to(action: 'new')
    end
  end

  def edit
    if !params[:search].nil?
        redirect_to(controller: 'pages', action: 'home', search: params[:search])
    else
      @lp = Lp.find(params[:id])
    end
  end

  def update
    lp = Lp.find(params[:lp][:id])
    lp.update(lp_params)
    redirect_to(action: 'show', id: lp.id)
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
