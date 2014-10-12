class AddSchoolDepartmentIndex < ActiveRecord::Migration
  def change
	  add_index :departments, :school_id
  end
end
