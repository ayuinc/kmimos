# config/initializers/will_paginate.rb
if defined?(WillPaginate)
  module WillPaginate
    module ActiveRecord
      
      module RelationMethods
        alias_method :per, :per_page
        alias_method :num_pages, :total_pages
        
        def per(value = nil) per_page(value) end
        def total_count() count end
      end
      
      module CollectionMethods
        alias_method :num_pages, :total_pages
      end
      
    end
  end
end
