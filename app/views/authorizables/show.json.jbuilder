

json.(@object, :id, :title, :created_at, :updated_at)
json.model_slug @object.class.model_slug

json.public @object.public?

json.user_permissions @object.allowed_users.each_with_rel do |user, viewable_by|
  json.user do
    json.extract! user, :id, :username, :name
  end
  json.level viewable_by.level
end

json.group_permissions @object.allowed_groups.each_with_rel do |group, viewable_by|
  json.group do
    json.extract! group, :id, :name
  end
  json.level viewable_by.level
end
