module Docs
  class Redis < UrlScraper
    self.type = 'redis'
    self.version = 'up to 3.0.4'
    self.base_url = 'http://redis.io/commands'
    self.links = {
      home: 'http://redis.io/',
      code: 'https://github.com/antirez/redis'
    }

    html_filters.push 'redis/entries', 'redis/clean_html', 'title'

    options[:container] = ->(filter) { filter.root_page? ? '#commands' : '.text' }
    options[:title] = false
    options[:root_title] = 'Redis'
    options[:follow_links] = ->(filter) { filter.root_page? }

    options[:attribution] = <<-HTML
      &copy; 2009&ndash;2015 Salvatore Sanfilippo<br>
      Licensed under the Creative Commons Attribution-ShareAlike License 4.0.
    HTML
  end
end
