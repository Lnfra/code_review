class UsersController < ApplicationController

  #Only allow logged in user to access the below actions
  before_action :restrict_access, only: [:edit, :update, :destroy, :landing]

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  #Get /landing
  def landing
    #Get all the questions
    @questions = Question.all
  end

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    # initially set all accounts as student type
    @user.roles << Role.find_by_name("Student")

    if @user.save
      flash[:success] = "User was successfully created."
      redirect_to @user
    else
      render :new
    end

  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      flash[:success] = "User was successfully updated."
      redirect_to @user
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    flash[:success] = "User was successfully deleted."
    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:avatar, :name, :email, :classroom_id, :password, :password_confirmation, :role_ids => [])
    end
end
