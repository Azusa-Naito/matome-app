class CreateClassroomTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :classroom_teachers do |t|
      t.references :teacher,   foreign_key: true
      t.references :classroom, foreign_key: true
      t.timestamps
    end
  end
end
