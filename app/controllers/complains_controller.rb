class ComplainsController < ApplicationController
    def create
        @complain = Complain.new(
            content: params[:complain][:content],
            company: Company.find(params[:company_id]),
            user_id: current_user.id
        )
        @complains.save
        respond_to do |format|
            format.js
        end
    end 
end
