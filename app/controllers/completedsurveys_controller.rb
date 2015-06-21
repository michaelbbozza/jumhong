class CompletedsurveysController < ApplicationController

  def index
    @completedsurveys = Completedsurvey.all
  end

  def new
    @completedsurvey = Completedsurvey.new
  end

  def create
    @completedsurvey = Completedsurvey.create(taker_id: session[:user_id], survey_id: params[:survey_id])
    redirect_to survey_completedsurveys_path
  end

  def show
    @survey = Survey.find(params[:survey_id])
  end

end

