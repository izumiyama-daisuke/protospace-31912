class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  before_action :move_to_index, only: [:edit]

  def index
    @prototype = Prototype.all
   
  end
  
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render  new_prototype_path
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
 
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to prototypes_index_path
  end

  def edit
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
    if @prototype.save
      redirect_to "/prototypes/#{@prototype.id}"
    else
      render "edit"
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @prototype.user_id
      redirect_to action: :index
    end
  end

end
