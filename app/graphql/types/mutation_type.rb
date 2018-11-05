module Types
  class MutationType < Types::BaseObject
    # TODO: remove me

    field :create_task, TaskType, null: true, description: "Create an task" do
      argument :task, Types::TaskInputType, required: true
    end

    field :update_task, Boolean, null: false, description: "Update an task" do
      argument :task, Types::TaskInputType, required: true
    end

    field :delete_task, Boolean, null: false, description: "Delete an task" do
      argument :id, ID, required: true
    end

    def create_task(task:)
      Task.create task.to_h
    end

    def update_task(task:)
      existing = Task.where(id: task[:id]).first
      existing&.update task.to_h
    end

    def delete_task(id:)
      Task.where(id: id).destroy_all
      true
    end
  end
end
