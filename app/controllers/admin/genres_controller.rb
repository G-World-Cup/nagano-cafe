class Admin::GenresController < ApplicationController
  before_action :set_product, only: [:edit, :update]
  before_action :authenticate_admin!


  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genres_params)
    @genre.save
    redirect_to request.referer
  end

  def edit
  end

  def update
    @genre.update(genres_params)
    redirect_to admin_genres_path
  end

  private

    def set_product
      @genre = Genre.find(params[:id])
    end

   def genres_params
     params.require(:genre).permit(:name)
   end
end
