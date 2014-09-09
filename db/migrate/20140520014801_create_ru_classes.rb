class CreateRuClasses < ActiveRecord::Migration
  def change
    create_table :ru_classes do |t|
      t.string :class_title, index: true
      t.string :class_code, index: true
      t.string :class_synopsis

      t.timestamps
    end
  end
end
