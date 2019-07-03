class SongsController < ApplicationController
    def index
        # byebug
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit
        @song = Song.find(params[:id])
    end

    def create
        @song = Song.new(song_params(params))
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def update
        @song = Song.find(params[:id])
        # byebug
        @song.update(song_params(params))
        if @song.valid?
            
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_path
    end

    def new
    end

    def song_params(params)
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre, :created_at, :updated_at)
    end
end
