class TrekCategoriesController < ApplicationController
  def create
    @trek_category = TrekCategory.create(trek_id: params[:trek_id],
                                         category_id: params[:category_id])
  end

  def destroy
    @trek_category = TrekCategory.find(params[:id])
    @trek_category.destroy
  end
end
