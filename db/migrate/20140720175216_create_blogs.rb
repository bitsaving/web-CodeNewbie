class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.string :slug

      t.timestamps
    end
  end
end
