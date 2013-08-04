require 'spec_helper'

describe TagsController do
  fixtures :tags
  let(:tag) { tags :house }

  context "with a tag that exists" do
    before { get :show, id: tag.id, format: 'json' }

    it "finds the tag successfully" do
      response.should be_success
    end

    it "returns the tag in json" do
      JSON.parse(response.body)['tag'].should include('name')
    end
  end

  context "with a tag that does not exist" do
    before { get :show, id: tag.id+1, format: 'json' }

    it "responds with an error" do
      response.should be_missing
    end
  end
end
