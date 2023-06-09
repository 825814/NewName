class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @answer = Answer.new(answer_params)

    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]
    if @answer.save
      flash[:notice] = "成功！"
      redirect_to("/questions/#{params[:question_id]}")
    else
      flash.now[:alert] = "失敗！"
      render "questions/show"
    end
  end

  # def edit
  #   @question = Question.find(params[:id])
  #   # @answer = Answer.find(params[:id])
  # end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end

end
