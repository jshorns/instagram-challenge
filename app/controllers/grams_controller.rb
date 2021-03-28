class GramsController < ApplicationController
  def index
  end

  def new
    @gram = Gram.new
  end

  def create
    @user = current_user
    @gram = @user.grams.create(gram_params)
    redirect_to grams_url
  end

  private
  def gram_params
    params.require(:gram).permit(:title, :image)
  end
end
