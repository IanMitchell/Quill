class ContentsController < ApplicationController
  respond_to :html, :js

  def create
    if author_signed_in?
      @content = Content.new(params[:content])

      @content.save

      respond_with @content
    end
  end

  def destroy
    if author_signed_in?
      @content = Content.find(params[:id])

      @content.destroy

      respond_with @content
    end
  end
end
