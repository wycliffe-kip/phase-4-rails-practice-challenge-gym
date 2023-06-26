class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response

    def show 
        gym = Gym.find(params[:id])
        render json: gym 
    end 

    def index 
        render json: Gym.all
    end 

    def update 
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        render json: gym, status: :ok
    end 

    def destroy
        gym = Gym.find(params[:id]) 
        gym.destroy
    end 

    private 

    def render_record_not_found_response 
        render json: { error: "Gym not found"}, status: :not_found
    end 

    def gym_params 
        params.permit(:name, :address)
    end 
end
