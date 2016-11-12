module SwellMedia
	class StaticController < ApplicationController

		def home
			# the homepage

			@results = SwellMedia::Article.published.order(publish_at: :desc)
			@results = @results.page(params[:page]).per(6)

			@featured_results = SwellMedia::Article.published.order(publish_at: :desc).limit(6)
			@featured_results.where( id: ENV['FEATURED_RESULTS'].split(',').collect{|str| str.strip.to_i } ) if ENV['FEATURED_RESULTS'].present?

			render layout: 'swell_media/homepage'
		end

	end
end