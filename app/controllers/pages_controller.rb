class PagesController < ApplicationController
  respond_to :html, :js

  def index
    @pages = Page.order("rank")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    if author_signed_in?
      @page = Page.new(params[:page])

      @page.save

      respond_with @page
    end
  end

  def update
    if author_signed_in?
      @page = Page.find(params[:id])

      @page.update_attributes(params[:page])

      respond_with @page
    end
  end

  def destroy
    if author_signed_in?
      @page = Page.find(params[:id])
      @page.destroy

      respond_with @page
    end
  end


  def sort
    params[:page].each_with_index do |id, index|
      Page.update_all(['rank=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
end
