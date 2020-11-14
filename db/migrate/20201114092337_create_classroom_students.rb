class CreateClassroomStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :classroom_students do |t|
      t.references :student,   foreign_key: true
      t.references :classroom, foreign_key: true
      t.timestamps
    end
  end
end
