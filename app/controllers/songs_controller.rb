class SongsController < ApplicationController
  before_action :find_artist, only: [:show, :edit, :update, :destroy]

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.valid?
      @song.save
      redirect_to @song
    else
      render :new
    end

  end

  def edit

  end

  def update
    @song.attributes=(song_params)

    if @song.valid?
      @song.save
      redirect_to @song
    else
      render :edit
    end

  end

  def show

  end

  def index
    @songs = Song.all

  end

  def destroy
  
    @song.delete
    redirect_to songs_path

  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def find_artist
    @song = Song.find(params[:id])
  end


end
