class AddSlugToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :slug, :string
  end
end
