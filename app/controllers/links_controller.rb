class LinksController < ApplicationController

  before_action :authenticate_user!

  # /collections
  def index
    redirect_to collections_url
  end

  # /collections/:id
  def show
    @link = Link.find(params[:id])
  end

  # /collections/new
  def new
    @collection = Collection.find(params[:collection_id])
    @link = Link.new()
  end

  # /collections
  def create
    @collection = Collection.find(params[:collection_id])
    @link = @collection.links.create(link_params)
    if @link.errors.empty?
      redirect_to collection_path(@collection) #/collection/:id
    else
      render "new"
    end
  end

  # /collections/:id/edit
  def edit
    @collection = Collection.find(params[:collection_id])
    @link = Link.find(params[:id])
  end

  # /collections/:id
  def update
    @collection = Collection.find(params[:collection_id])
    @link = @collection.links.update(params[:id], link_params)
    if @link.errors.empty?
      redirect_to collection_path(@link.collection_id) #/collection/:id
    else
      render "edit"
    end

  end

  # /collections/:id
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to collection_path(@link.collection_id)
  end

  private

     def link_params
       params.require(:link).permit(:name, :collection_id, :reference, :description)
     end
end
