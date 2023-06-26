class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
    def show 
        client = Client.find(params[:id]) 
        render jason: client
    end 

    def index 
        clients = Client.all 
        render json: clients
    end 

    def update 
        client = Client.find(params[:id])
        client.update(client_params)
        render json: client, status: :created
    end 

    private 

    def render_record_not_found_response
        render json: {error: "Client not found"}, status: :not_found
    end 

    def render_record_invalid_response(invalid) 
        render json: {error: invalid}
    end 

    def client_params 
        params.permit(:name, :age)
    end 
end