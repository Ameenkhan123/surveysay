class RemoveUserIdSurveyIdQuestionIdAnswerIdToResult < ActiveRecord::Migration[5.1]
  def change
    remove_column :results, :user_id, :integer
    remove_column :results, :survey_id, :integer
    remove_column :results, :question_id, :integer
    remove_column :results, :answer_id, :integer
  end
end
