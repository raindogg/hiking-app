class CategoriesController < ApplicationController
  def create
    @category = Category.create(name: params[:name])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end
end
