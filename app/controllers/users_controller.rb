class UsersController < ApplicationController
    
    def index

        @users = User.all

        if is_var_A
            render 'index_var_a'
        elsif is_control
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