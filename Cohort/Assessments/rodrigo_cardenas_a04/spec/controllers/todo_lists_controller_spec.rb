require 'rails_helper'

# So specs will run and not throw scary errors before PostsController is implemented
begin
  TodoListsController
rescue
  TodoListsController = nil
end

RSpec.describe TodoListsController, :type => :controller do
  let(:jack) { User.create!(nickname: 'jack_bruce', password: 'abcdef') }

  describe "GET #new" do
    context "when logged in" do

      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it "renders the new todo lists page" do
        get :new, todo_list: {}
        expect(response).to render_template("new")
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        get :new, todo_list: {}
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "GET #index" do
    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        get :index, todo_list: {}
        expect(response).to redirect_to(new_session_url)
      end
    end
  end


  describe "PATCH #update" do
    context "when logged in as a different user" do
      create_jill_with_todo_list

      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it "should not allow users to update another user's todo lists" do
        begin
          post :update, id: jill_todo_list, todo_list: {name: "Jack Hax"}
        rescue ActiveRecord::RecordNotFound
        end

        expect(jill_todo_list.name).to eq("Jill List")
      end
    end
  end

  describe "POST #create" do

    before do
      allow(controller).to receive(:current_user) { jack }
    end

    context "with invalid params" do
      it "validates the presence of title and description" do
        post :create, todo_list: {description: "this is an invalid todo list"}
        expect(response).to render_template("new")
      end
    end

    context "with valid params" do
      it "redirects to the post show page" do
        post :create, todo_list: {name: "Things to Do", description: "do it"}
        expect(response).to redirect_to(todo_list_url(TodoList.last))
      end
    end
  end
end
