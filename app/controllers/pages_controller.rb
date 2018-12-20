class PagesController < ApplicationController
  def home
    if params[:tolist] == 'LPS'
      if params[:artist].nil?
        @lps = Lp.all
      else
        @lps = Artist.find(params[:artist]).lps
      end
    else
      if !params[:search].nil?
        @artists = Artist.where('LOWER(name) Like ?', "%#{params[:search].downcase}%")
      else
        @artists = Artist.all
      end
      params[:tolist]='ARTISTS'
    end
  end
end
