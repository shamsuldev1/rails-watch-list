class BookmarksController < ApplicationController
    before_action :set_bookmark only: [:show, :edit, :update, :destroy]
    before_action :set_list, only: [:new]
    def new
        @bookmark = Bookmark.new
    end

    def create
        @bookmark = Bookmark.new(bookmark_params)
        @list = List.find(params[:list_id])
        @bookmark.list = @list
        if @bookmark.save
            redirect_to @list
        else
            render :new
        end
    end

    def destroy
        @bookmark = Bookmark.find(params[:id])
        @bookmark.destroy

    end

private
    def set_bookmark
        @bookmark = bookmark.find(params[:id])

    def set_list
        @list = List.find(params[:list_id])
    end

    def bookmark_params
        params.require(:bookmark).permit(:comment, :movie_id)
    end
end
