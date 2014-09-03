require 'test_helper'

class RandomisationEntriesControllerTest < ActionController::TestCase
  setup do
    @randomisation_entry = randomisation_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:randomisation_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create randomisation_entry" do
    assert_difference('RandomisationEntry.count') do
      post :create, randomisation_entry: { action: @randomisation_entry.action, object: @randomisation_entry.object, randomisation_session_id: @randomisation_entry.randomisation_session_id }
    end

    assert_redirected_to randomisation_entry_path(assigns(:randomisation_entry))
  end

  test "should show randomisation_entry" do
    get :show, id: @randomisation_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @randomisation_entry
    assert_response :success
  end

  test "should update randomisation_entry" do
    patch :update, id: @randomisation_entry, randomisation_entry: { action: @randomisation_entry.action, object: @randomisation_entry.object, randomisation_session_id: @randomisation_entry.randomisation_session_id }
    assert_redirected_to randomisation_entry_path(assigns(:randomisation_entry))
  end

  test "should destroy randomisation_entry" do
    assert_difference('RandomisationEntry.count', -1) do
      delete :destroy, id: @randomisation_entry
    end

    assert_redirected_to randomisation_entries_path
  end
end
