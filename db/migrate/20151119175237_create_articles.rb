class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
