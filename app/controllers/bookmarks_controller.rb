class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(params_bookmark)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
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

  def params_bookmark
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
