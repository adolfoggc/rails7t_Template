require 'rails_helper'

RSpec.describe "dnd_sheets/new", type: :view do
  before(:each) do
    assign(:dnd_sheet, DndSheet.new(
      name: "MyString",
      folk: 1,
      gender: 1
    ))
  end

  it "renders new dnd_sheet form" do
    render

    assert_select "form[action=?][method=?]", dnd_sheets_path, "post" do

      assert_select "input[name=?]", "dnd_sheet[name]"

      assert_select "input[name=?]", "dnd_sheet[folk]"

      assert_select "input[name=?]", "dnd_sheet[gender]"
    end
  end
end
