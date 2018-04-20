class SurveysController < ApplicationController

	def index
		@surveys = Survey.all
		respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @surveys }
        end
      end
      def answer_question
      	@survey = Survey.find(params[:id])
   @survey.update(answer_question_params) # not sure this is best way here, need to research a better way to create the nested resources rather than update
 end
 def new
 	@survey = Survey.new
 	2.times do
 		question = @survey.questions.build
 		4.times { question.answers.build }
 	end

 end

 def create
 	@survey = Survey.new(survey_params)
 	if @survey.save
 		redirect_to @survey
 	else
 		render 'new'
 	end
 end
 def results

 	@survey = Survey.find(params[:results][:survey_id])
 	# @answer = Answer.find(params[:results][:answer_id])
  if 
     # @answer.correct?
     params[:results][:correct].to_i == 1
     hash.each do |question, answer|
      puts "#question id this #{question}-----"
      puts "answer for this question #{answer}"
    end
    flash[:notice] = "You ur Passed."
  else
   flash[:notice] = "You ur fail."
 end
 redirect_to survey_path(@survey.id)
end

def show
  @survey = Survey.find(params[:id])
  respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @survey }
        end
      end

      def edit
      	@survey = Survey.find(params[:id])
      	respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @survey }
        end

      end
      def update
      	@survey = Survey.find(params[:id])

      	if @survey.update(survey_params)
      		redirect_to @survey
      	else
      		render 'edit'
      	end
      end

      def destroy
      	@survey = Survey.find(params[:id])
      	@survey.destroy
      	redirect_to surveys_path

      end
      def result
      	@survey = Survey.find(params[:result][:survey_id])

      	if
          {:question=>"question", :answer=>"answer"}
          @questions = @survey.questions
          @answers = @questions.map{|q| q.answers.build}
          @answers.each do |a|
            a.correct = @survey == 1
          end

          respond_to do |format|
    format.html #
  end
  flash[:notice] = "You ur Passed."
else
end
end


private

def survey_params
	params.require(:survey).permit(:name, :results, :user_id ,questions_attributes: [:id, :content, :correct, :_destroy, answers_attributes: [:id, :content, :is_correct, :correct, :_destroy]])
end

end
