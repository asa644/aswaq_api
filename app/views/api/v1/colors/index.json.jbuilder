json.array! @colors do |color|
  json.extract! color, :id, :colorvalue
end
