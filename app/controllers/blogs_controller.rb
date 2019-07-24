class BlogsController < ApplicationController
  def index
     @carousels = Carousel.order(created_at: :asc)
     @blogs = Blog.where(status: true).order(created_at: :desc)  
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def travelaround
    
  end

  def foodie
    
  end

  def introduction
    
  end

  def drawing
    
  end
end
