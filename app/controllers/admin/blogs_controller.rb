class Admin::BlogsController < Admin::BaseController
  before_action :set_blog , only:[:show,:edit,:update,:destroy]

  def index
    @blogs = Blog.where(status: true).order(created_at: :desc).page(params[:page]).per(20)
    @categories = Category.order(created_at: :desc)
  end

  def drafts
    @blogs = Blog.where(status: false).order(created_at: :desc).page(params[:page]).per(20)
    @categories = Category.order(created_at: :desc)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if params[:commit] == "Save Draft"
      @blog.status = false
    else
      @blog.status = true
    end

    if @blog.save
      if @blog.status == true
        @blog.save
        flash[:notice] = "Blog was successfully created"
      else
        flash[:notice] = "Blog Draft was successfully created"
      end
      redirect_to admin_root_path
    else
      flash.now[:alert] = "Blog was failed to create"
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

    if params[:commit] == "Save Draft"
      @blog.status = false
    else
      @blog.status = true
    end
    
    if @blog.update(blog_params)
      if @blog.status == true    
        flash[:notice] = "Blog was successfully updated"
      else
        flash[:notice] = "Blog Draft was successfully updated"
      end
      redirect_to admin_blog_path(@blog)    
    else
      flash[:notice] = "Failed to update"
      render :edit 
    end  
  end

  def destroy
    #@blog = Blog.find(params[:id])
    @blog.destroy
    if @blog.status == true    
      flash[:notice] ="Blog was successfully deleted"
    else
      flash[:notice] ="Blog Draft was successfully deleted"
    end
    redirect_to admin_root_path
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title,:date,:description,:image,:category_id)
  end
end
