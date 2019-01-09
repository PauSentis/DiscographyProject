class ArtistController < ApplicationController
  def show
    if !params[:search].nil?
        redirect_to(controller: 'pages', action: 'home', search: params[:search])
    else
      @artist = Artist.find(params[:id])
    end
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new(artist_params)
    if artist.save
      redirect_to(action: 'show', id: artist.id)
    else
      redirect_to(action: 'new')
    end
  end

  def edit
    if !params[:search].nil?
        redirect_to(controller: 'pages', action: 'home', search: params[:search])
    else
      @artist = Artist.find(params[:id])
    end
  end

  def update
    artist = Artist.find(params[:artist][:artist_id])
    artist.update(artist_params)
    redirect_to(action: 'show', id: params[:artist][:artist_id])
  end

  def delete
    artist = Artist.find(params[:id])
    for lp in artist.lps
      lp.destroy
    end
    artist.destroy
    redirect_to root_path
  end

  private
    def artist_params
      params.require(:artist).permit(:name, :description, :url)
    end
end
