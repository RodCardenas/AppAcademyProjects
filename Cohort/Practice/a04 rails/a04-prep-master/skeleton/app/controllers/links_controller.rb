class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :verify_user_is_owner, only: [:edit, :update, :destroy]
  before_action :require_user

  def index
    @links = Link.all
  end

  def show
  end

  def new
    @link = Link.new
  end

  def edit
  end

  def create
    # if link_params[:url] && link_params[:title]
      @link = Link.new(link_params)

      if @link.save
        redirect_to @link, notice: 'Link was successfully created.'
      else
        flash[:errors] = @link.errors.full_messages
        render :new
      end
    # else
    #   flash[:errors] = 'Link could not be created.'
    #   render :new
    # end
  end

  def update
    if @link.update(link_params)
      redirect_to @link, notice: 'Link was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to links_url, notice: 'Link was successfully destroyed.'
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:title, :url)
    end

    def verify_user_is_owner
      if current_user != @link.user
        redirect_to links_url
      end
    end
end
