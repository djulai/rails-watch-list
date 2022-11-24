class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(list_params)
    @bookmark.save
    # No need for app/views/restaurants/create.html.erb
    redirect_to bookmarks_path(@bookmark)
  end

  private

  def list_params
    params.require(:bookmark).permit(:comment)
  end

end
