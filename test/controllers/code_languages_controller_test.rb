require 'test_helper'

class CodeLanguagesControllerTest < ActionController::TestCase
  setup do
    @code_language = code_languages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:code_languages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create code_language" do
    assert_difference('CodeLanguage.count') do
      post :create, code_language: {  }
    end

    assert_redirected_to code_language_path(assigns(:code_language))
  end

  test "should show code_language" do
    get :show, id: @code_language
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @code_language
    assert_response :success
  end

  test "should update code_language" do
    patch :update, id: @code_language, code_language: {  }
    assert_redirected_to code_language_path(assigns(:code_language))
  end

  test "should destroy code_language" do
    assert_difference('CodeLanguage.count', -1) do
      delete :destroy, id: @code_language
    end

    assert_redirected_to code_languages_path
  end
end
