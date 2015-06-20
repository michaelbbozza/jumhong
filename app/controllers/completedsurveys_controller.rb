class CompletedsurveysController < ApplicationController

  def index
    @completedsurveys = Completedsurvey.all
  end

  def new
  end

  def create
    @completedsurvey = Completedsurvey.create(completedsurvey_params)
    redirect_to survey_completedsurveys_path
  end

  def show
    @survey = Survey.find(params[:survey_id])
  end

  private

  def completedsurvey_params
  	params.require(:completedsurvey).permit(:taker_id => session[:user_id], :survey_id)
  end

end

