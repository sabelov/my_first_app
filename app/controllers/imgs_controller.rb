class ImgsController < ApplicationController

  before_action :authenticate_user!

  # /collections
  def index
    redirect_to collections_url
  end

  # /collections/:id
  def show
    @img = Img.find(params[:id])
  end

  # /collections/new
  def new
    @collection = Collection.find(params[:collection_id])
    @img = Img.new()
  end

  # /collections
  def create
    @collection = Collection.find(params[:collection_id])
    @img = @collection.imgs.create(img_params)
    if @img.errors.empty?
      redirect_to collection_path(@collection) #/collection/:id
    else
      render "new"
    end
  end

  # /collections/:id/edit
  def edit
    @collection = Collection.find(params[:collection_id])
    @img = Img.find(params[:id])
  end

  # /collections/:id
  def update
    @collection = Collection.find(params[:collection_id])
    @img = @collection.imgs.update(params[:id], img_params)
    if @img.errors.empty?
      redirect_to collection_path(@img.collection_id) #/collection/:id
    else
      render "edit"
    end

  end

  # /collections/:id
  def destroy
    @img = Img.find(params[:id])
    @img.destroy
    redirect_to collection_path(@img.collection_id)
  end

  private

     def img_params
       params.require(:img).permit(:name, :collection_id, :picture, :description)
     end
end
