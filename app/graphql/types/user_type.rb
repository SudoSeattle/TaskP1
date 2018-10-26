module Types
  Types::UserType = GraphQL::ObjectType.define do
    name 'User'

    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
  end
end
