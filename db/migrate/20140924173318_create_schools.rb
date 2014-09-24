class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :website
      t.string :summary
      t.string :address
      t.integer :phone

      t.timestamps
    end
  end
end