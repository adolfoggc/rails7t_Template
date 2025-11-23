require 'rails_helper'

RSpec.describe "dnd_sheets/index", type: :view do
  before(:each) do
    assign(:dnd_sheets, [
      DndSheet.create!(
        name: "Name",
        folk: 2,
        gender: 3
      ),
      DndSheet.create!(
        name: "Name",
        folk: 2,
        gender: 3
      )
    ])
  end

  it "renders a list of dnd_sheets" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
