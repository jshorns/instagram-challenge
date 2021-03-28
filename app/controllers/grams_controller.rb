class GramsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @grams = Gram.all
    @comment = Comment.new
  end

  def new
    @gram = Gram.new
  end

  def create
    @user = current_user
    @gram = @user.grams.create(gram_params)
    redirect_to grams_url
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
  def gram_params
    params.require(:gram).permit(:title, :image, :description)
  end
end
