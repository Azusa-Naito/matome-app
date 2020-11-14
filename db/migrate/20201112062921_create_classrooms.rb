class CreateClassrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :classrooms do |t|
      t.string     :name,       null: false
      t.date       :year_month, null: false
      t.timestamps
    end
  end
end
