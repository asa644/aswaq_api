class CreateSearchResults < ActiveRecord::Migration
  def change
    create_view :search_results
  end
end
