require 'spec_helper'
require 'rails_helper'

if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

describe SearchController, type: :controller do
  let(:current_user) { instance_double('User', :session_token => "1", :id => 1) }
  let(:current_user_items) {
    [
      instance_double('Item', :user_id => 1),
      instance_double('Item', :user_id => 1),
      instance_double('Item', :user_id => 1),
      instance_double('Item', :user_id => 1),
      instance_double('Item', :user_id => 1)
    ]
  }

  let(:items) {
    [
      instance_double('Item', :user_id => 1),
      instance_double('Item', :user_id => 2),
      instance_double('Item', :user_id => 3),
      instance_double('Item', :user_id => 4),
      instance_double('Item', :user_id => 5)
    ]
  }

  before(:each) do
    controller.extend(SessionsHelper)
  end

  describe "Get #index" do
    context "when user is logged in" do
      before do
        session[:session_token] = current_user.session_token
        allow(controller).to receive(:current_user).and_return(current_user)
      end

      it "assigns @results to current user's items" do
        allow(Item).to receive(:get_users_search_items).and_return(current_user_items)
        get :index, params: {}
        expect(assigns(:results)).to match_array(current_user_items)
      end

      it 'calls get_users_search_items' do
        expect(Item).to receive(:get_users_search_items).with(current_user, {"action"=>"index", "controller"=>"search", "params"=>{}})
        get :index, params: {}
      end
    end

    context "when user is not logged in" do
      it "assigns @results to all items" do
        allow(Item).to receive(:get_search_items).and_return(items)
        get :index, params: {}
        expect(assigns(:results)).to match_array(items)
      end

      it 'calls get_search_items' do
        expect(Item).to receive(:get_search_items).with({"action"=>"index", "controller"=>"search", "params"=>{}})
        get :index, params: {}
      end
    end
  end
end





