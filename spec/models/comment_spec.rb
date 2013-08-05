require 'spec_helper'

describe Comment do
  fixtures :links
  let(:link) { links :afterhours }
  subject { Comment.new body: "I *am* a comment.", link: link }

  it "compiles the markdown-formatted body to html" do
    subject.to_html.should == "<p>I <em>am</em> a comment.</p>\n"
  end
end
