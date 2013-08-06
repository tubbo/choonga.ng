require 'spec_helper'

describe CommentsController do
  include Devise::TestHelpers
  fixtures :links, :users, :comments
  let(:link) { links :afterhours }
  let(:user) { users :tubbo }
  before { sign_in user }

  describe "viewing all comments on the site" do
    before { get :index, format: :json }

    it "responds successfully" do
      response.should be_success
    end

    it "returns a collection of comments" do
      assigns(:comments).should_not be_empty
    end
  end

  describe "viewing all comments for a link" do
    before { get :index, link_id: link.id, format: :json }

    it "responds successfully" do
      response.should be_success
    end

    it "returns a collection of comments for a given link" do
      alien_comment = comments :justthestart_troll

      assigns(:comments).map(&:id).should_not include(alien_comment.id)
    end
  end

  describe "adding a comment to a link" do
    before do
      post :create, link_id: link.id, comment: {
        body: 'test',
        user_id: user.id
      }, format: :json
    end

    it "responds successfully" do
      response.should be_success
    end

    it "persists the comment to the database" do
      Comment.where(body: 'test').count.should_not be_zero
    end
  end

  context "with a comment"  do
    let(:comment) { comments :afterhours_troll }
    let(:comment_id) { comment.id }

    describe "editing" do
      before do
        put :update, link_id: link.id, id: comment_id, \
          comment: { body: 'changed' }, format: :json
      end

      it "responds successfully" do
        response.should be_success
      end

      it "changes the comment on the server" do
        comment.reload.should be_true
        comment.body.should == 'changed'
      end
    end

    describe "removing" do
      before do
        delete :destroy, link_id: link.id, id: comment_id, format: :json
      end

      it "redirects to index" do
        response.should be_success
      end

      it "deletes the comment from the database" do
        Comment.where(id: comment_id).count.should be_zero
      end
    end
  end
end
