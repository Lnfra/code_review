class CodeLanguagesController < ApplicationController
  before_action :set_code_language, only: [:show, :edit, :update, :destroy]

  # GET /code_languages
  def index
    @code_languages = CodeLanguage.all
  end

  # GET /code_languages/1
  def show
  end

  # GET /code_languages/new
  def new
    @code_language = CodeLanguage.new
  end

  # GET /code_languages/1/edit
  def edit
  end

  # POST /code_languages
  def create
    @code_language = CodeLanguage.new(code_language_params)
    if @code_language.save
      flash[:success] = "Code language was successfully created."
      redirect_to @code_language
    else
      render :new
    end
  end

  # PATCH/PUT /code_languages/1
  def update
    if @code_language.update(code_language_params)
      flash[:success] = "Code language was successfully updated."
      redirect_to @code_language
    else
      render :edit
    end
  end

  # DELETE /code_languages/1
  def destroy
    @code_language.destroy
    flash[:success] = "Code language was successfully deleted."
    redirect_to code_languages_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code_language
      @code_language = CodeLanguage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def code_language_params
      params.require(:code_language).permit(:name)
    end
end
