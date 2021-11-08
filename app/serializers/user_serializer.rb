class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :is_disabled, :step_verify, :verify_type
end
