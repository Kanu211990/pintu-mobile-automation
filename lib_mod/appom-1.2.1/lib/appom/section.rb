module Appom
  class Section
    include Appium
    include ElementContainer
    include ElementFinder

    attr_reader :root_element, :parent

    def initialize(parent, root_element)
      @parent = parent
      @root_element = root_element
    end

    def page
      root_element || super
    end

    def parent_page
      candidate_page = parent
      candidate_page = candidate_page.parent until candidate_page.is_a?(Appom::Page)
      candidate_page
    end
  end
end
