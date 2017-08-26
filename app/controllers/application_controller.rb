class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end


# if __FILE__ == $PROGRAM_NAME

# endclass ApplicationController < ActionController::Base
#   protect_from_forgery with: :exception
#   before_action :authenticate_user!
# end
