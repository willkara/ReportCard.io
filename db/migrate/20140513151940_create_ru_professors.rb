class CreateRuProfessors < ActiveRecord::Migration
  def change
    create_table :ru_professors do |t|
      t.string :first_name, index: true
      t.string :last_name, index: true
      t.string :email
      t.string :department

      t.timestamps
    end
  end
end
