class CreateChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.references :classroom,   foreign_key: true
      t.references :teacher,     foreign_key: true
      t.references :student,     foreign_key: true
      t.timestamps
    end
  end
end
