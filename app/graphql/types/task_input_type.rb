class Types::TaskInputType < GraphQL::Schema::InputObject
  graphql_name "TaskInputType"

  argument :id, ID, required: false
  argument :content, String, required: true
end
