class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :survey_id

      t.timestamps
    end
  end
end
