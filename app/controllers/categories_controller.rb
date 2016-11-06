class CategoriesController < ApplicationController
  def create
    @category = Category.create(name: params[:name])
  end
end
