class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
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
  # POST /users.json
  def create
    @user = User.new(user_params)

    # initially set all accounts as student type
    @user.roles << Role.find_by_name("Student")

    save_photo

    if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    save_photo
    if @user.update(user_params)
       redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  def profile_photo
      @user = User.find(params[:id])
      send_data @user.photo_file_contents, :type => @user.photo_content_type,:disposition => 'inline'
  end

  private

    def sanitize_filename(filename)
      # Get only the filename, not the whole path (for IE)
      # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
      return File.basename(filename)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def save_photo
      @photo = params[:user].delete :photo
      if @photo
        @user.photo_filename = sanitize_filename(@photo.original_filename)
        @user.photo_content_type = @photo.content_type
        @user.photo_file_contents = @photo.read
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :classroom_id, :password, :password_confirmation, :role_ids => [])
    end
end
