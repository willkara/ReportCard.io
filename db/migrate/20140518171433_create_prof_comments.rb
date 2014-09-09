class CreateProfComments < ActiveRecord::Migration
  def change
    create_table :prof_comments do |t|
      t.references :ru_professor, index: true
      t.references :user, index: true
      t.string :body

      t.timestamps
    end
  end
end
