class AddStudentsSubjectsTable < ActiveRecord::Migration
  def self.up
    create_table 'students_subjects', :id => false do |t|
      t.integer :student_id
      t.integer :subject_id
    end

    add_index :students_subjects, [:student_id, :subject_id]
  end

  def self.down
    drop_table :students_subjects
  end

end
