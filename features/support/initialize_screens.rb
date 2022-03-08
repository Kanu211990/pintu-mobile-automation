class InitializeScreens
  ATTRIBUTES = %i[login_screen account_detail_screen register_screen].freeze
  attr_accessor(*ATTRIBUTES)

  def initialize
    platform = ENV['platform']
    ATTRIBUTES.each do |key|
      klass = eval("::#{platform.capitalize}::#{key.to_s.split('_').collect(&:capitalize).join}.new")
      instance_variable_set(:"@#{key}", klass)
    end
  end
end
