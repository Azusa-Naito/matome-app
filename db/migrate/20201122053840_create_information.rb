class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string     :title,    null: false
      t.integer    :genre_id, null: false
      t.text       :content,  null: false
      t.references :teacher,  foreign_key: true
      t.timestamps
    end
  end
end