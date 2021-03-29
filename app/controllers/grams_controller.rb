class GramsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @grams = Gram.all
    @comment = Comment.new
  end

  def edit
    @gram = Gram.find(params[:id])
  end

  def new
    @gram = Gram.new
  end

  def create
    @user = current_user
    @gram = @user.grams.create(create_gram_params)
    redirect_to grams_url
  end

  def update
    @gram = Gram.find(params[:id])
    respond_to do |format|
      if @gram.update(edit_gram_params)
        format.html { redirect_to :root, notice: "Gram was successfully updated." }
        format.json { render :show, status: :ok, location: @gram }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gram.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @gram = Gram.find(params[:id])
    @gram.destroy
    respond_to do |format|
      format.html { redirect_to :root, notice: "Gram was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
  def create_gram_params
    params.require(:gram).permit(:image, :description)
  end

  def edit_gram_params
    params.require(:gram).permit(:description)
  end
end
