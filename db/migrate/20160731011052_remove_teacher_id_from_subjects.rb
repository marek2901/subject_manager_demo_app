class RemoveTeacherIdFromSubjects < ActiveRecord::Migration
  def change
    remove_column :subjects, :teachers_id, :remove
  end
end
