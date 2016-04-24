class TodoItemsController < ApplicationController
  def show
    @todo_item = TodoItem.find(params[:id])
  end


  def create
    @todo_item = TodoItem.new(todo_items_params)

    if @todo_item.save
      flash[:notice] =  'Item was successfully created.'
    else
      flash[:notice] = @todo_item.errors.full_messages
    end
    redirect_to todo_list_url(@todo_item.todo_list_id)
  end

  def destroy
    @todo_item = TodoItem.find(params[:id])

    @todo_item.destroy
    redirect_to todo_list_url(@todo_item.todo_list_id)
  end

  private
  def todo_items_params
    params.require(:todo_item).permit(:body, :completed, :todo_list_id)
  end
end
