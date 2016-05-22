class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  # GET /classrooms
  def index
    @classrooms = Classroom.all
  end

  # GET /classrooms/1
  def show
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms
  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      flash[:success] = "Classroom was successfully created."
      redirect_to @classroom
    else
      render :new
    end
  end

  # PATCH/PUT /classrooms/1
  def update
    if @classroom.update(classroom_params)
      flash[:success] = "Classroom was successfully updated."
      redirect_to @classroom
    else
      render :edit
    end
  end

  # DELETE /classrooms/1
  def destroy
    @classroom.destroy
    flash[:success] = "Classroom was successfully deleted."
    redirect_to classrooms_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_params
      params.require(:classroom).permit(:name, :start_date, :end_date, :location_id)
    end
end
