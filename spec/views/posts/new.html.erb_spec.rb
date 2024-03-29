require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post,
      :titulo => "MyString",
      :usuario => "MyString",
      :texto => "MyText"
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path, :method => "post" do
      assert_select "input#post_titulo", :name => "post[titulo]"
      assert_select "input#post_usuario", :name => "post[usuario]"
      assert_select "textarea#post_texto", :name => "post[texto]"
    end
  end
end
