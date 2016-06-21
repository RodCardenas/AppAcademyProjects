class ContactsController < ApplicationController
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def index
    all_contacts = []
    contacts = Contact.where(user_id: params[:user_id])

    contacts.each do |contact|
      contact.shared_users.each do |shared_c|
        all_contacts << shared_c unless all_contacts.include?(shared_c)
      end
      all_contacts << contact  unless all_contacts.include?(contact)
    end

    all_contacts.sort_by! {|a| a[:name]}
    render json: all_contacts#.to_json( only: [:name, :email])
  end

  def show
    render json: Contact.find(params[:id])
  end

  def create
    contacts = Contact.new(contacts_params)
    if contacts.save
      render json: contacts
    else
      render(
        json: contacts.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    contacts = Contact.find(params[:id])
    if contacts.update(contacts_params)
      render json: contacts
    else
      render(
        json: contacts.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contacts = Contact.find(params[:id])
    render json: contacts
    contacts.delete
  end

  private
  def contacts_params
    params.require(:contacts).permit(:name, :email, :user_id)
  end
end
