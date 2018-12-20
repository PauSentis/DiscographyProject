class ArtistController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
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
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to(action: 'show', id: artist.id)
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
