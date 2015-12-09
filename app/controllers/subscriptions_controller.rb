class SubscriptionsController < ApplicationController
	# POST /subscriptions
	# POST /subscriptions.json

	def create
		@subscription = current_user.subscriptions.build(:interest_id => params[:friend_id])
		if @subscription.save
			flash[:notice] = "Subscribed to this interest!"
			redirect_to user_path(current_user.id)
		else
			flash[:notice] = "Unable to subscribe."
			redirect_to root_path
		end
	end

	def destroy
		@subscription = current_user.subscriptions.find(params[:id])
		@subscription.destroy
		flash[:notice] = "No longer subscribed."
		redirect_to user_path(current_user.id)
	end

	private

	def subscription_params
		params.require(:subscription).permit(:user_id, :interest_id)
	end
end
