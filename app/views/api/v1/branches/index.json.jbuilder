json.array! @branches do |branch|
  json.extract! branch, :id, :branchName
end
