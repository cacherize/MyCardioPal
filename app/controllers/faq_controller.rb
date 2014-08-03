class FaqController < ApplicationController
  def index
    @faqs = Faq.by_user(current_user)
    @grouped_faqs = @faqs.in_groups(3, false)
    @new_faq = Faq.new
  end

  def create
    @new_faq = Faq.new(params[:faq])

    respond_to do |format|
      if @new_faq.save
        format.html{redirect_to faq_index_path, notice: 'Success! Added FAQ!'}
      else
        @faqs = Faq.by_user(current_user)
        @grouped_faqs = @faqs.in_groups(3, false)
        format.html{render :index}
      end
    end
  end

  def update
  end
end
