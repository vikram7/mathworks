class AddIndexToForeignKey < ActiveRecord::Migration
  def change
    add_index :courses, :source_id
  end
end
