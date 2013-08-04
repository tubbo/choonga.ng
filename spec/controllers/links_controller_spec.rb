require 'spec_helper'

describe LinksController do
  fixtures :links
  let(:link) { links :afterhours }

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
    context "with valid parameters" do
      before { post :create, link: { title: 'test', url: 'http://example.com' } }

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
    context "that has already been posted" do
      let(:link_id) { link.id }
      before { delete :destroy, id: link_id }

      it "removes the link from the db" do
        Link.find(link_id).should be_nil
      end

      it "redirects to index" do
        response.should be_redirect
      end
    end

    context "that has not been posted" do
      before { delete :destroy, id: link_id+1 }

      it "redirects to index with an alert" do
        response.should be_redirect
      end
    end
  end
end
