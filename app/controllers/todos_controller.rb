class TodosController < ApplicationController
  before_action :set_todo, only: %i[show edit update destroy toggle]

  def index
    @filter = params[:filter].presence || "all"
    
    all_todos = Todo.all
    @total_count = all_todos.count
    @completed_count = all_todos.completed_list.count
    @active_count = all_todos.active_list.count
    @progress_percentage = @total_count.zero? ? 0 : ((@completed_count.to_f / @total_count) * 100).round

    @todos = case @filter
             when "active"
               all_todos.active_list.ordered
             when "completed"
               all_todos.completed_list.ordered
             else
               all_todos.ordered
             end

    @new_todo = Todo.new
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.turbo_stream
        format.html { redirect_to todos_path, notice: "할 일이 추가되었습니다." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.turbo_stream
        format.html { redirect_to todos_path, notice: "할 일이 수정되었습니다." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def toggle
    @todo.update(completed: !@todo.completed)
    
    fetch_stats

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to todos_path }
    end
  end

  def destroy
    @todo.destroy
    fetch_stats

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to todos_path, notice: "할 일이 삭제되었습니다." }
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :content, :completed, :due_date, :priority)
  end

  def fetch_stats
    all_todos = Todo.all
    @total_count = all_todos.count
    @completed_count = all_todos.completed_list.count
    @active_count = all_todos.active_list.count
    @progress_percentage = @total_count.zero? ? 0 : ((@completed_count.to_f / @total_count) * 100).round
  end
end
