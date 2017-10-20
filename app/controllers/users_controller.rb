class ApplicationController::Base
    
        def render *args
    
            binding.pry
    
            options = args.extract_options!
            args << options
            super *args
    
        end
    
    end
    

class UsersController < ApplicationController

    before_action :render_optimizely_variation
    
    def index
        @users = User.all
    end

    def show 
        @user = User.find(params[:id])
    end
end