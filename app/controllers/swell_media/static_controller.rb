module SwellMedia
	class StaticController < ApplicationController

		def about



		end

		def home
			# the homepage

			@results = SwellMedia::Article.published.order(publish_at: :desc)
			@results = @results.page(params[:page]).per(6)

			render layout: 'swell_media/homepage'
		end

	end
end