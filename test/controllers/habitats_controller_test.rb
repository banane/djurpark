require "test_helper"

class HabitatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @habitat = habitats(:one)
  end

  test "should get index" do
    get habitats_url, as: :json
    assert_response :success
  end

  test "should create habitat" do
    assert_difference("Habitat.count") do
      post habitats_url, params: { habitat: { descriptors: @habitat.descriptors } }, as: :json
    end

    assert_response :created
  end

  test "should show habitat" do
    get habitat_url(@habitat), as: :json
    assert_response :success
  end

  test "should update habitat" do
    patch habitat_url(@habitat), params: { habitat: { descriptors: @habitat.descriptors } }, as: :json
    assert_response :success
  end

  test "should destroy habitat" do
    assert_difference("Habitat.count", -1) do
      delete habitat_url(@habitat), as: :json
    end

    assert_response :no_content
  end
end
