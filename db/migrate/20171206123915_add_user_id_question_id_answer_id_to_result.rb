class AddUserIdQuestionIdAnswerIdToResult < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :user_id, :integer
    add_column :results, :question_id, :integer
    add_column :results, :answer_id, :integer
  end
end
