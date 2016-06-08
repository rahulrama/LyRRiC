class StatementsController < ApplicationController
  def index
    @statements = Statement.all
  end

  def new
    @statement = Statement.new
  end

  def create
    statement = Statement.new(statement_params)
    if statement.save
      current_user.statements << statement
      redirect_to statements_path
    else
      render :new
    end
  end

  private

  def statement_params
    params.require(:statement).permit(:title, :all_tags)
  end

end
