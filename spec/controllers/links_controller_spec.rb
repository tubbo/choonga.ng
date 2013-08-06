require 'spec_helper'

describe LinksController do
  include Devise::TestHelpers
  fixtures :links, :users
  let(:link) { links :afterhours }
  before { sign_in users(:tubbo) }

  describe "viewing a collection" do
    context "of all links" do
      before { get :index, format: 'json' }

      it "responds successfully" do
        response.should be_success
      end

      it "includes a collection of links" do
        assigns(:links).should_not be_empty
      end

      it "renders those links to json" do
        json_response = JSON.parse(response.body)

        json_response.should_not be_nil
        json_response['links'].should_not be_empty
      end
    end

    context "of links that match search filters" do
      before { get :index, title: link.title, format: 'json' }

      it "responds successfully" do
        response.should be_success
      end

      it "includes the link that was searched for" do
        assigns(:links).should_not be_empty
        assigns(:links).should include(link)
      end
    end
  end

  describe "viewing a single link" do
    context "that has been posted to the site" do
      before { get :show, id: link.id, format: 'json' }

      it "responds successfully" do
        response.should be_success
      end

      it "renders the link in json" do
        json_response = JSON.parse response.body

        json_response.should_not be_nil
        json_response['link'].should_not be_empty
      end
    end

    context "that does not exist" do
      before { get :show, id: link.id+1, format: 'json' }

      it "responds with a 404 error" do
        response.should be_missing
      end
    end
  end

  describe "posting a new link" do
    let(:params) do
      {
        title: 'test',
        url: 'http://example.com',
        service_id: link.service_id,
        tag_id: link.tag_id
      }
    end

    context "with valid parameters" do
      before do
        post :create, link: params, format: 'json'
      end

      it "has a service id" do
        params[:service_id].should be_present
        params[:service_id].should_not be_blank
        params[:service_id].should == link.service_id
      end

      it "redirects to the post" do
        response.should be_success
        JSON.parse(response.body).should include('link')
      end
    end

    context "with invalid parameters" do
      before { post :create, link: { title: 'hello' } }

      it "responds with validation messages" do
        JSON.parse(response.body).should include('errors')
      end
    end
  end

  describe "removing a link" do
    let(:link_id) { link.id }

    context "that has already been posted" do
      before { delete :destroy, id: link_id }

      it "removes the link from the db" do
        Link.where(id: link_id).should_not be_any
      end

      it "redirects to index" do
        response.should be_redirect
      end
    end

    context "that has not been posted" do
      before { delete :destroy, id: link_id+1 }

      it "throws a 404 error" do
        response.should be_missing
      end
    end
  end
end
