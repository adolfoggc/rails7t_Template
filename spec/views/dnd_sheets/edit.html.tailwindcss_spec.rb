require 'rails_helper'

RSpec.describe "dnd_sheets/edit", type: :view do
  let(:dnd_sheet) {
    DndSheet.create!(
      name: "MyString",
      folk: 1,
      gender: 1
    )
  }

  before(:each) do
    assign(:dnd_sheet, dnd_sheet)
  end

  it "renders the edit dnd_sheet form" do
    render

    assert_select "form[action=?][method=?]", dnd_sheet_path(dnd_sheet), "post" do

      assert_select "input[name=?]", "dnd_sheet[name]"

      assert_select "input[name=?]", "dnd_sheet[folk]"

      assert_select "input[name=?]", "dnd_sheet[gender]"
    end
  end
end
