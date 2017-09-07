class RemoveAcademyIdFromAcademy < ActiveRecord::Migration[5.0]
  def change
    remove_column :academies, :academy_id, :integer
  end
end
