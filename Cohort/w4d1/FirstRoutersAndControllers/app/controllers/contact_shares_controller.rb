class ContactSharesController < ApplicationController
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def create
    contact_shares = ContactShare.new(contact_shares_params)
    if contact_shares.save
      render json: contact_shares
    else
      render(
        json: contact_shares.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact_shares = ContactShare.find(params[:id])
    render json: contact_shares
    contact_shares.delete
  end

  private
  def contact_shares_params
    params.require(:contact_shares).permit(:user_id, :contact_id)
  end
end
