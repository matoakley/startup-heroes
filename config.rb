# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

config[:host] = "http://localhost:4567"

activate :blog do |blog|
  blog.sources = "blog/{year}-{month}-{day}-{title}.html"
  blog.permalink = "blog/{title}"
  blog.paginate = true
  blog.per_page = 10
end

activate :directory_indexes

activate :imageoptim

activate :robots, sitemap: 'https://www.startupheroes.co.uk/sitemap.xml'

activate :seo_sitemap do |sitemap|
  sitemap.default_host = 'https://www.startupheroes.co.uk'
end

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def hire_us_post_url
    if build?
      'https://www.formdump.com/f/ay4XKdrb'
    else
      'http://localhost:3000/f/2bLD'
    end
  end

  def blog_subscribe_post_url
    if build?
      'https://www.formdump.com/f/8LdmqdrK'
    else
      'http://localhost:3000/f/2AX6'
    end
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  config[:host] = "https://www.startupheroes.co.uk"
  activate :minify_css
  activate :minify_javascript
end
