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

  def show
    @faq = Faq.find(params[:id])

    render(partial: 'faq_item', locals: {faq: @faq})
  end

  def edit
    @faq = Faq.find(params[:id])

    render(partial: 'faq_form', locals: {faq: @faq})
  end

  def update
    @edit_faq = Faq.find(params[:id])
    
    respond_to do |format|
      if @edit_faq.update_attributes(params[:faq])
        format.html{redirect_to faq_index_path, notice: "Success! Updated FAQ!"}
      else
        @new_faq = Faq.new
        @faqs = Faq.by_user(current_user)
        @grouped_faqs = @faqs.in_groups(3, false)
        format.html{render :index}
      end
    end
  end
end
