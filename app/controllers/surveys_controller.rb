class SurveysController < ApplicationController
  before_action :require_logged_in

  def index
    @surveys = Survey.all
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      user = User.find(session[:user_id])
      user.surveys << @survey
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
    @question = @survey.questions.order("created_at desc")
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
    survey.questions.destroy_all
    redirect_to surveys_path
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description)
  end

end
