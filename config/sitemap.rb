SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(
		fog_provider: 'AWS',
		:aws_access_key_id      => ENV['AMZN_ASOC_KEY'],       # required
		:aws_secret_access_key  => ENV['AMZN_ASOC_SECRET'],     # required
		fog_directory: ENV['FOG_DIRECTORY']
)


#SitemapGenerator::Sitemap.create_index = false
SitemapGenerator::Sitemap.default_host = "#{SwellMedia.default_protocol}://#{SwellMedia.app_host}"
SitemapGenerator::Sitemap.public_path = 'tmp/'

#SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new #
SitemapGenerator::Sitemap.sitemaps_host = ENV['ASSET_HOST'] || "http://#{ENV['FOG_DIRECTORY']}.s3.amazonaws.com/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
	add '/'
	add '/about'
	add '/categories/all', lastmod: SwellMedia::Article.published.order(publish_at: :desc, id: :desc).first.try(:publish_at)


	SwellMedia::Category.active.find_each do |category|
		add "/categories/#{category.slug}", lastmod: SwellMedia::Article.published.where( category: category ).order(publish_at: :desc, id: :desc).first.try(:publish_at)
	end

	SwellMedia::Article.published.find_each do |article|
		add "#{article.path}", lastmod: article.updated_at, priority: => 0.9
	end

	SwellMedia::Page.published.find_each do |page|
		add "#{page.path}", lastmod: page.updated_at
	end


end