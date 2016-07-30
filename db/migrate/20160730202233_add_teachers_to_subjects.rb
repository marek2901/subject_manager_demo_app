class AddTeachersToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :teacher_id, :integer
    add_reference :subjects, :teachers, index: true, foreign_key: true
  end
end
