class AddDepartmentInfoToRuClass < ActiveRecord::Migration
  def change
    add_column :ru_classes, :department_id, :integer

    add_index :ru_classes, :department_id
  end
end
