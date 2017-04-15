require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :title => "MyString",
      :content => "MyText",
      :user => nil,
      :topic => nil
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "textarea#post_content[name=?]", "post[content]"

      assert_select "input#post_user_id[name=?]", "post[user_id]"

      assert_select "input#post_topic_id[name=?]", "post[topic_id]"
    end
  end
end
