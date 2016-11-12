class CategoriesController < ApplicationController

	def show

		@category = SwellMedia::Category.friendly.find( params[:id] ) unless params[:id] == 'all'
		@tags = params[:tags] || [params[:tag]] if params[:tag].present? || params[:tags].present?
		@search_term = params[:q]

		@title = @category.try(:name)
		@title ||= "##{@tags.join(' #')}" if @tags.present?
		@title ||= 'All'

		@subtitle = @category.try(:description) || '~'
		@tags = params[:tags]


		@results = SwellMedia::Article.published
		@results = @results.where( category: @category ) if @category.present?
		@results = @results.with_all_tags( params[:tags] ) if @tags.present?

		if @search_term.present?
			search_array = @search_term.downcase.gsub(/[^\sa-z0-9]/, '').split(' ').select{ |str| str.strip.present? }
			@results = @results.where( "regexp_split_to_array(lower(title), E'\\\\s+') && array['#{search_array.join("','")}']" ).order("( SELECT COUNT(*) FROM ( SELECT UNNEST( regexp_split_to_array(lower(title), E'\\\\s+' ) ) INTERSECT SELECT UNNEST( array['#{search_array.join("','")}'] ) ) intersect_elements ) DESC")
		end

		@results = @results.order(publish_at: :desc)

		@results = @results.page(params[:page]).per(6)

	end


end