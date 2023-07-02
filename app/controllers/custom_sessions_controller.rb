class CustomSessionsController < Devise::SessionsController
    
    def create
      super do |resource|
        if signed_in?
          render json: resource 
          return
        end
      end
    end
    
end
  