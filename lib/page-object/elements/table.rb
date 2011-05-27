module PageObject
  module Elements
    class Table < Element
      
      def initialize(element, platform)
        @element = element
        include_platform_for platform
      end
      
      protected
      
      def include_platform_for platform
        super
        if platform[:platform] == :watir
          require 'page-object/platforms/watir_table'
          self.class.send :include, PageObject::Platforms::WatirTable
        else
          require 'page-object/platforms/selenium_table'
          self.class.send :include, PageObject::Platforms::SeleniumTable
        end
      end
    end
  end
end