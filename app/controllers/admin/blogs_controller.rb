class Admin::BlogsController < Admin::BaseController
  before_action :set_blog , only:[:show,:edit,:update,:destroy]

  def index
    @blogs = Blog.order(created_at: :desc)
    @categories = Category.order(created_at: :desc)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = "blog was successfully created"
      redirect_to admin_root_path
    else
      flash.now[:alert] = "blog was failed to create"
      render :new
    end
  end

  def show
    #@blog = Blog.find(params[:id])
  end

  def edit
    #@blog = Blog.find(params[:id])
  end

  def update 
    #@blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      flash[:notice] = "blog was successfully updated"
      redirect_to admin_blog_path(@blog)
    else
      flash.now[:alert] = "blog was failed to update"
      render :edit
    end 
  end

  def destroy
    #@blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to admin_root_path
    flash[:alert]="blog was deleted"
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title,:date,:description,:image,:category_id)
  end
end
