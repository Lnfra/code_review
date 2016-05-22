class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :restrict_access

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question was successfully created."
      redirect_to @question
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      flash[:success] = "Question was successfully updated."
      redirect_to @question
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    flash[:success] = "Question was successfully deleted."
    redirect_to questions_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :content, :user_id)
    end
end
