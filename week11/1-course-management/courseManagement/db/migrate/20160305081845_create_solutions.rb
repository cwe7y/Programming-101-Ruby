class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :text
      t.belongs_to :task, foreign_key: true, index: true, null: false
      t.timestamps null: false
    end
  end
end
