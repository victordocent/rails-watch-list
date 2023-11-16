class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      render 'lists/show'
    end
  end

  def destroy
    list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(list)
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

end
