class HomeController < ApplicationController

    def index
       
    end

private

  def search_params
    params.permit(:name)
  end

end
