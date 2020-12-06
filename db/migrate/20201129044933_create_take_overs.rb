class CreateTakeOvers < ActiveRecord::Migration[6.0]
  def change
    create_table :take_overs do |t|
      t.datetime   :start_time, null: false
      t.text       :content,    null: false
      t.text       :detail,     null: false
      t.text       :appearance, null: false
      t.references :classroom,  foreign_key: true
      t.references :teacher,    foreign_key: true
      t.timestamps
    end
  end
end
