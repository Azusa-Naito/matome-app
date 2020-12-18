class CreateHomeworks < ActiveRecord::Migration[6.0]
  def change
    create_table :homeworks do |t|
      t.datetime   :start_time, null: false
      t.text       :content,    null: false
      t.integer    :judgement,  null: false
      t.references :classroom,  foreign_key: true
      t.references :teacher,    foreign_key: true
      t.timestamps
    end
  end
end
