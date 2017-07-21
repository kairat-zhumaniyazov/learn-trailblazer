class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :weight
      t.belongs_to :thing, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
