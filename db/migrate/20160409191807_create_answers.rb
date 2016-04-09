
class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answer do |t|
      t.text :body

      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
