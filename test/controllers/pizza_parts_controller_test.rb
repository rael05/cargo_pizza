require "test_helper"

class PizzaPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pizza_part = pizza_parts(:one)
  end

  test "should get index" do
    get pizza_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_pizza_part_url
    assert_response :success
  end

  test "should create pizza_part" do
    assert_difference("PizzaPart.count") do
      post pizza_parts_url, params: { pizza_part: { category: @pizza_part.category, description: @pizza_part.description, name: @pizza_part.name, price: @pizza_part.price } }
    end

    assert_redirected_to pizza_part_url(PizzaPart.last)
  end

  test "should show pizza_part" do
    get pizza_part_url(@pizza_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_pizza_part_url(@pizza_part)
    assert_response :success
  end

  test "should update pizza_part" do
    patch pizza_part_url(@pizza_part), params: { pizza_part: { category: @pizza_part.category, description: @pizza_part.description, name: @pizza_part.name, price: @pizza_part.price } }
    assert_redirected_to pizza_part_url(@pizza_part)
  end

  test "should destroy pizza_part" do
    assert_difference("PizzaPart.count", -1) do
      delete pizza_part_url(@pizza_part)
    end

    assert_redirected_to pizza_parts_url
  end
end
