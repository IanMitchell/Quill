class CategoryController < ApplicationController
  def index
    @categories = Category.where('name LIKE ?', "%#{params[:q]}%")

    respond_to do |format|
      format.html
      format.json { render :json => @categories.map(&:attributes) }
    end
  end
end
