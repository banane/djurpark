require "test_helper"

class AnimalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @animal = animals(:one)
  end

  test "should get index" do
    get animals_url, as: :json
    assert_response :success
  end

  test "should create animal" do
    assert_difference("Animal.count") do
      post animals_url, params: { animal: { dietary_requirements: @animal.dietary_requirements, feeding_times: @animal.feeding_times, status: @animal.status, tasks: @animal.tasks } }, as: :json
    end

    assert_response :created
  end

  test "should show animal" do
    get animal_url(@animal), as: :json
    assert_response :success
  end

  test "should update animal" do
    patch animal_url(@animal), params: { animal: { dietary_requirements: @animal.dietary_requirements, feeding_times: @animal.feeding_times, status: @animal.status, tasks: @animal.tasks } }, as: :json
    assert_response :success
  end

  test "should destroy animal" do
    assert_difference("Animal.count", -1) do
      delete animal_url(@animal), as: :json
    end

    assert_response :no_content
  end
end
