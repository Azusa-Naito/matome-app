class CreateInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiries do |t|
      t.text       :content,     null: false
      t.references :information, foreign_key: true
      t.references :teacher,     foreign_key: true
      t.references :student,     foreign_key: true
      t.timestamps
    end
  end
end
