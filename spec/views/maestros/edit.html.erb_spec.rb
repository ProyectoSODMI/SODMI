require 'spec_helper'

describe "maestros/edit" do
  before(:each) do
    @maestro = assign(:maestro, stub_model(Maestro,
      :idmaestro => 1,
      :nombre => "MyString",
      :email => "MyString",
      :fotografia => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit maestro form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form", :action => maestros_path(@maestro), :method => "post" do
      assert_select "input#maestro_idmaestro", :name => "Clave"
      assert_select "input#maestro_nombre", :name => "maestro[nombre]"
      assert_select "input#maestro_email", :name => "maestro[email]"
      assert_select "input#maestro_fotografia", :name => "maestro[fotografia]"
      assert_select "input#maestro_password", :name => "maestro[password]"
    end
  end
end
