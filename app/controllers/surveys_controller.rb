class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to surveys_path
    else
      render :new
    end
  end

  def new
    @survey = Survey.new
  end

  def edit
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description)
  end

end