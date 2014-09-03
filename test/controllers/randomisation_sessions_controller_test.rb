require 'test_helper'

class RandomisationSessionsControllerTest < ActionController::TestCase
  setup do
    @randomisation_session = randomisation_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:randomisation_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create randomisation_session" do
    assert_difference('RandomisationSession.count') do
      post :create, randomisation_session: { name: @randomisation_session.name }
    end

    assert_redirected_to randomisation_session_path(assigns(:randomisation_session))
  end

  test "should show randomisation_session" do
    get :show, id: @randomisation_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @randomisation_session
    assert_response :success
  end

  test "should update randomisation_session" do
    patch :update, id: @randomisation_session, randomisation_session: { name: @randomisation_session.name }
    assert_redirected_to randomisation_session_path(assigns(:randomisation_session))
  end

  test "should destroy randomisation_session" do
    assert_difference('RandomisationSession.count', -1) do
      delete :destroy, id: @randomisation_session
    end

    assert_redirected_to randomisation_sessions_path
  end
end
