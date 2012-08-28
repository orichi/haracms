class Admin::DashboardController < AdminController
  before_filter :current_page
  def index
    @products = Product.find(:all,:order=>"id desc",:limit=>10)
    @messages = Message.find(:all,:order=>"id desc",:limit=>10)
  end
  
  private
    def current_page
      @current = "root"
    end
end
