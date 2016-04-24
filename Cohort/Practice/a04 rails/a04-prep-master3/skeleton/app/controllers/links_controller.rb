class LinksController < ApplicationController
  before_action :ensure_user_logged_in
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_is_creator, only:[:edit, :update]

  def index
    @links = Link.all
  end

  def show
  end

  def new
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to @link, notice: 'Link was successfully created.'
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(link_params)
      redirect_to @link, notice: 'Link was successfully created.'
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:title, :url)
    end

    def ensure_user_logged_in
      if current_user.nil?
        redirect_to new_session_url
      end
    end

    def ensure_user_is_creator
      if current_user.id != @link.user_id
        redirect_to links_url
      end
    end
end
