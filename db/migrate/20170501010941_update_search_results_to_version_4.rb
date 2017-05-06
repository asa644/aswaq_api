class UpdateSearchResultsToVersion4 < ActiveRecord::Migration
  def change
    drop_view :search_results
  end
end
