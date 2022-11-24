class BookmarksController < ApplicationController

  before_action :find_list, only: [ :index, :show, :new, :create ]

  def index
    @bookmarks = @list.bookmarks
  end

  def show
    @bookmark = @list.bookmarks.find(params[:id])
  end

  def new
    @bookmark = @list.bookmarks.new
  end

  def create
    @bookmark = @list.bookmarks.new(bookmark_params)
    @bookmark.save

    redirect_to list_bookmarks_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
