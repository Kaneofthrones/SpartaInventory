class CreateAcademies < ActiveRecord::Migration[5.0]
  def change
    create_table :academies do |t|
      t.string :name
      t.integer :academy_id

      t.timestamps
    end
  end
end
