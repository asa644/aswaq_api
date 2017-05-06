class UpdateSearchResultsToVersion3 < ActiveRecord::Migration
  def change
    update_view :search_results, version: 3, revert_to_version: 2
  end
end
