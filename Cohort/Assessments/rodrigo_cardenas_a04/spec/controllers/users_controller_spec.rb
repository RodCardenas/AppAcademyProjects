require 'rails_helper'

# So specs will run and not throw scary errors before UsersController is implemented
begin
  UsersController
rescue
  UsersController = nil
end

RSpec.describe UsersController, :type => :controller do

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post :create, user: {nickname: "jack_bruce", password: ""}
        expect(response).to render_template("new")
      end

      it "validates that the password is at least 6 characters long" do
        post :create, user: {nickname: "jack_bruce", password: "short"}
        expect(response).to render_template("new")
      end
    end

    context "with valid params" do
      it "redirects user to posts index on success" do
        post :create, user: {nickname: "jack_bruce", password: "password"}
        expect(response).to redirect_to(todo_lists_url)
      end
    end
  end
end
