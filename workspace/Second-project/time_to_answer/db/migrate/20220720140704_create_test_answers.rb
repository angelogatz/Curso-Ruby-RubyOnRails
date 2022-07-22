class CreateTestAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :test_answers do |t|
      t.references :answer, foreign_key: true
      t.references :user_test, foreign_key: true

      t.timestamps
    end
  end
end
