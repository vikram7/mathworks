class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.text :description
      t.string :image_url
      t.string :url, null: false
      t.integer :source_id, null: false

      t.timestamps
    end
  end
end
