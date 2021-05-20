class Admin::GenreController < ApplicationController
    def index
        @genre = Genre.new
        @genres = Genre.all
    end
    
    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            redirect_to admin_genre_index_path, success: "ジャンル登録しました"
        else
            render 'index'
        end
    end
    
    def edit
        @genre = Genre.find(params[:id])
    end
    
    def update
        @genre = Genre.find(params[:id])
        if @genre.update(genre_params)
            redirect_to admin_genre_index_path, success: "ジャンル編集しました"
        else
            render 'edit'
        end
    end
    
    def genre_params
     params.require(:genre).permit(:name, :validation)
    end
end
