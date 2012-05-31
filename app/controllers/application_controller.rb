class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :handle_subdomain

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def handle_subdomain
    subdomain =  request.subdomain

    search_path = subdomain.empty? ? %{"$user", public} : [subdomain.to_s, "public"].compact.join(",")
    puts "search_path = "+search_path

    connection = ActiveRecord::Base.connection
    ActiveRecord::Base.connection.schema_search_path = search_path
  end
end
