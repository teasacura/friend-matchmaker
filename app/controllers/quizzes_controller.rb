class QuizzesController < ApplicationController

  def new
    @quiz = Quiz.new
  end

  def create
    user = current_user
    @quiz = Quiz.create(user: user, q1: params[:q1],q2: params[:q2],q3: params[:q3],q4: params[:q4], q5: params[:q5])
    @quiz.score = @quiz.total
    @quiz.save
    redirect_to user
  end



  # private

  # def quiz_params
  #   params.require(:quiz).permit(:)
  # end
end
