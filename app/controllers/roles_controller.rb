class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET /roles
  def index
    @roles = Role.all
  end

  # GET /roles/1
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:success] = "Role was successfully created."
      redirect_to @role
    else
      render :new
    end
  end

  # PATCH/PUT /roles/1
  def update
    if @role.update(role_params)
      flash[:success] = "Role was successfully updated."
      redirect_to @role
    else
      render :edit
    end
  end

  # DELETE /roles/1
  def destroy
    @role.destroy
    flash[:success] = "Role was successfully deleted."
    redirect_to roles_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name)
    end
end
