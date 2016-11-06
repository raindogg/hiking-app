class TrekCategoriesController < ApplicationController
  def create
    @trek_category = TrekCategory.create(trek_id: params[:trek_id],
                                         category_id: params[:category_id])
  end
end
