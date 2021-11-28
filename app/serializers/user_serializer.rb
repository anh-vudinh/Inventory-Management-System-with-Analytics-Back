class UserSerializer < ActiveModel::Serializer
  attributes :username, :is_disabled
end
