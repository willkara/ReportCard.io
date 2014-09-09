class CreateProfClassMaps < ActiveRecord::Migration
  def change
    create_table :prof_class_maps do |t|
      t.references :ru_class
      t.references :ru_professor
      t.timestamps
    end
  end
end
