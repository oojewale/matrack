class Task < ActiveManager
  property :task_id, :int, primary_key: true
  property :title, :str, nullable: false
  property :start, :str
  property :done, :str
  create_table
end