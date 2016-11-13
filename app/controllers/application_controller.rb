class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	helper SwellMedia::Engine.helpers

	before_filter :init_page_meta
	before_filter :featured_results


	protected
	def featured_results

		@featured_results = SwellMedia::Article.published.order(publish_at: :desc).limit(6)
		@featured_results.where( id: ENV['FEATURED_RESULTS'].split(',').collect{|str| str.strip.to_i } ) if ENV['FEATURED_RESULTS'].present?

	end


end
