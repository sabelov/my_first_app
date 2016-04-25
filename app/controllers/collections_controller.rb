class CollectionsController < ApplicationController
  before_action :authenticate_user!

  # /collections
  def index
    @collections = Collection.where(user_id: current_user.id)
  end

  # /collections/:id
  def show
    @collection = Collection.find(params[:id])
    @imgs = Img.where(collection_id: @collection.id)
  end

  # /collections/new
  def new
    @collection = Collection.new()
  end

  # /collections
  def create
    #collection_params = params.require(:collection).permit(:name)
    @collection = Collection.create(collection_params)
    @collection.update_attributes(user_id: current_user.id)
    # @collection.user_id = current_user.id
    if @collection.errors.empty?
      redirect_to collection_path(@collection) #/collection/:id
    else
      render "new"
    end
  end

  # /collections/:id/edit
  def edit
  end

  # /collections/:id
  def update
  end

  # /collections/:id
  def destroy
  end

  def show_all_collections
    @collections = Collection.all
    redirect_to collections_path
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  # #  def set_post
  # #    @post = Post.find(params[:id])
  # #  end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
     def collection_params
       params.require(:collection).permit(:name)
     end
end
