class SupportTicketsController < ApplicationController
  def index
  end

  def new
    @support_ticket = SupportTicket.new
  end

  def create
    @support_ticket = SupportTicket.new(params[:support_ticket])
    
    respond_to do |format|
      if @support_ticket.save
        format.html{redirect_to root_path, notice: "Successfully submitted a support ticket. Please wait 24-48 hours for a response."}
      else
        format.html{render :new}
      end
    end
  end
end
