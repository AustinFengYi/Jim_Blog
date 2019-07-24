class Admin::CarouselsController < Admin::BaseController
  #before_action :set_category , only:[:update,:destroy]

  def index 
    @carousels = Carousel.order(created_at: :asc)
  end

  def new
    @carousel = Carousel.new
  end

  def create
    @carousel = Carousel.new(carousel_params)
    if @carousel.save
      flash[:notice] = "carousel was successfully created"
      redirect_to admin_carousels_path
    else
      flash.now[:alert] = "carousel was failed to create"
      render :new
    end
  end

  def edit
    @carousel = Carousel.find(params[:id])
  end

  def update
    @carousel = Carousel.find(params[:id])
    if @carousel.update(carousel_params)
      flash[:notice] = "carouesel was successfully updated"
      redirect_to admin_carousels_path
    else
      flash[:alert] = "Failed to update"
      render :edit
    end
  end

  def destroy
    @carousel = Carousel.find(params[:id])
    @carousel.destroy
    flash[:alert] = "carousel was successfully deleted"
    redirect_to admin_carousels_path
  end 

  private

  #def set_category
   # @category = Category.find(params[:id])
  #end

  def carousel_params
    params.require(:carousel).permit(:title,:image,:description,:category_id)
  end
end
