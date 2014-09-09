class AddDepartmentInfoToRuProfessor < ActiveRecord::Migration
    def change
      add_column :ru_professors, :department_id, :integer

      add_index :ru_professors, :department_id
    end

end
