class UpdateSearchResultsToVersion2 < ActiveRecord::Migration
  def change
    update_view :search_results, version: 2, revert_to_version: 1
  end
end
