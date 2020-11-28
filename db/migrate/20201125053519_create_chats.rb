class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.text       :text,        null: false
      t.integer    :judgement,   null: false
      t.references :chatroom,    foreign_key: true
      t.timestamps
    end
  end
end
