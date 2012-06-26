class PagesController < ApplicationController
  def show
    @page =
      if params[:id] == -1
        Page.find_by_identifier("home")
      else
        Page.find_by_id(params[:id])
      end

    unless @page
      flash[:error] = "Invalid Page"
      redirect_to root_path
    end
  end
end
