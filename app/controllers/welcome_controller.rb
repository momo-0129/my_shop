class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    #@portal_session = current_user.payment_processor.billing_portal
    @user = User.new
  end

end
