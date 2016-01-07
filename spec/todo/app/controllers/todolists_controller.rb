class TodolistsController < Matrack::BaseController
  def index
    @email = session[:email]
    @task = Task.all
  end

  def new
  end

  def show
    if params["id"]
      @task = Task.find(params["id"])
    end
  end

  def edit
  end

  def create
    task = Task.new
    task.title = params["title"]
    task.start = params["start"]
    task.done = params["done"]
    @msg = "Task successfully created" if task.save
    @msg = "Task creation failed" unless @msg
    render :new
  end

  def update
    id = params["id"].to_i unless params.nil?
    title = params["title"]
    start = params["start"]
    done = params["done"]
    updater(id, title, start, done)
    render :show
  end

  def destroy
    id = params["task_id"]
    @msg = "Task successfully deleted" if Task.destroy(id)
    @msg = "Unable to delete task" unless @msg
    render :index
  end

  def top_five
    tasks = Task.limit(5)
    @msg = tasks.first.title
    render :index
  end

  def first_task
    @msg = Task.first.title
    render :index
  end

  def find_task_by
    task = Task.find_by("title", "Finish Scheduler app")
    @msg = task.start
    render :index
  end

  private

  def updater(id, title, start, done)
    if id && !done.nil?
      Task.update(id, title: title, start: start, done: "yes")
    elsif id
      Task.update(id, title: title, start: start)
    end
    @msg = "Task successfully updated"
    @msg = "Operation failed" unless id
  end
end