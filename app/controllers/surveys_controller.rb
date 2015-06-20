class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
    @user = User.find(session[:user_id])
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
    @survey = Survey.find(params[:id])
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def update
    survey = Survey.find(params[:id])
    survey.assign_attributes(survey_params)
    if survey.save
      redirect_to surveys_path
    else
      render :edit
    end
  end

  def destroy
    survey = Survey.find(params[:id])
    survey.destroy
    redirect_to surveys_path
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description)
  end

end
