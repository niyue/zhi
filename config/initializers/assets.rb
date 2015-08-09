# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( select2.full.min.js select2.min.css select_tag.js )

%w( multiple_choices essays ).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.js.coffee", "#{controller}.css"]
end
