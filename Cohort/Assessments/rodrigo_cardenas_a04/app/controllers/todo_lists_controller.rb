class TodoListsController < ApplicationController
  before_action :require_user
  before_action :user_must_be_creator, only:[:edit, :update]

  def index
    @todo_lists = TodoList.where(user_id: current_user.id)
  end

  def new
    @todo_list = TodoList.new
  end

  def show
    @todo_list = TodoList.find(params[:id])
  end

  def create
    @todo_list = current_user.todo_lists.new(todo_list_params)

    if @todo_list.save
      redirect_to @todo_list, notice: 'List was successfully created.'
    else
      flash[:notice] = @todo_list.errors.full_messages
      render :new
    end
  end

  def edit
    @todo_list = TodoList.find(params[:id])
  end

  def update
    @todo_list = TodoList.find(params[:id])

    if @todo_list.update_attributes(todo_list_params)
      redirect_to todo_list_url(@todo_list), notice: "List successfully updated!"
    else
      flash.now[:notice] = @todo_list.errors.full_messages
      render :edit
    end
  end

  private
  def todo_list_params
    params.require(:todo_list).permit(:name, :description)
  end

  def require_user
    if current_user.nil?
      redirect_to new_session_url
    end
  end

  def user_must_be_creator
    @todo_list = TodoList.find(params[:id])

    if current_user.id != @todo_list.user_id
      redirect_to todo_list_url
    end
  end
end
