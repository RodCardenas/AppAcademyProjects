class CommentController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    render json: comment
    comment.delete
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
