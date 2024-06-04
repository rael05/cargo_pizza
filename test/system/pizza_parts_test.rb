require "application_system_test_case"

class PizzaPartsTest < ApplicationSystemTestCase
  setup do
    @pizza_part = pizza_parts(:one)
  end

  test "visiting the index" do
    visit pizza_parts_url
    assert_selector "h1", text: "Pizza parts"
  end

  test "should create pizza part" do
    visit pizza_parts_url
    click_on "New pizza part"

    fill_in "Category", with: @pizza_part.category
    fill_in "Description", with: @pizza_part.description
    fill_in "Name", with: @pizza_part.name
    fill_in "Price", with: @pizza_part.price
    click_on "Create Pizza part"

    assert_text "Pizza part was successfully created"
    click_on "Back"
  end

  test "should update Pizza part" do
    visit pizza_part_url(@pizza_part)
    click_on "Edit this pizza part", match: :first

    fill_in "Category", with: @pizza_part.category
    fill_in "Description", with: @pizza_part.description
    fill_in "Name", with: @pizza_part.name
    fill_in "Price", with: @pizza_part.price
    click_on "Update Pizza part"

    assert_text "Pizza part was successfully updated"
    click_on "Back"
  end

  test "should destroy Pizza part" do
    visit pizza_part_url(@pizza_part)
    click_on "Destroy this pizza part", match: :first

    assert_text "Pizza part was successfully destroyed"
  end
end
