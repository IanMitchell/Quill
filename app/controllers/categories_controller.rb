class CategoriesController < ApplicationController
  def index
    @categories = Category.where('name LIKE ?', "%#{params[:q]}%")

    respond_to do |format|
      format.json
    end
  end
end
