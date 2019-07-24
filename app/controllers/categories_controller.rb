class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @blogs = @category.blogs.where(status: true).order(created_at: :desc)
  end
end
