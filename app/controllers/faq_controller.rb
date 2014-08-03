class FaqController < ApplicationController
  def index
    @faqs = Faq.all
    @grouped_faqs = @faqs.in_groups(3, false)
  end

  def create
  end

  def update
  end
end
