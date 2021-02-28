class AddMoreFieldsToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :language, :string
    add_column :courses, :short_description, :text, default: "English", null: false
    add_column :courses, :price, :integer, default: "0", null: false
    add_column :courses, :level, :string, default: "Beginner", null: false
  end
end
