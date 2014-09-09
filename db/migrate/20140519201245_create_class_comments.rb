class CreateClassComments < ActiveRecord::Migration
  def change
    create_table :class_comments do |t|
      t.references :ru_class, index: true
      t.references :user, index: true
      t.string :body

      t.timestamps
    end
  end
end
