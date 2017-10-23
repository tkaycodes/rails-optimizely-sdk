class UsersController < ApplicationController
    
    def index

        @users = User.all

        if is_var_A
            optimizely_client.track('VAR_A_VISIT', optimizely_user)            
            render 'index_var_a'
        elsif is_control
            optimizely_client.track('CONTROL_VISIT', optimizely_user)            
            render 'index_control'
        end


    end

    def show 
        @user = User.find(params[:id])
    end


    private

    def is_var_A
        optimizely_variation === "varA"
    end

    def is_control
        optimizely_variation === "control"
    end


end