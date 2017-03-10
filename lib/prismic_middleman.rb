require 'middleman-core'

require 'prismic_middleman/version'
require 'prismic_middleman/core'

::Middleman::Extensions.register(:prismic, PrismicMiddleman::Core)
