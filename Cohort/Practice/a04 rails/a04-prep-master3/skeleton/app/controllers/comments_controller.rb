class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(link_params)

    if @comment.save
      redirect_to @comment.link, notice: 'Comment was successfully created.'
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to :back
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def link_params
      params.require(:comment).permit(:body, :link_id)
    end
end
