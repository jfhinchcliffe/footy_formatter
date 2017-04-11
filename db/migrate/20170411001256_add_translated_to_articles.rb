class AddTranslatedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :translated, :text
  end
end
