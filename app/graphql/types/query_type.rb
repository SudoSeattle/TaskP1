Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :tasks do
    type types[Types::TaskType]
    resolve ->(_obj, _args, _ctx) {
      Task.all
    }
  end
end
