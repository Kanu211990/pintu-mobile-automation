# rubocop:disable Metrics/ModuleLength
module BaseHelper
  def self.wait_for
    Selenium::WebDriver::Wait.new(timeout: 10).until { yield }
  end

  def self.long_wait
    Selenium::WebDriver::Wait.new(timeout: 30).until { yield }
  end

  def self.swipe_using_elements(access_type1, access_name1, access_type2, access_name2)
    # to get start x,y co-ordinates
    ele_from = wait_for { $driver.find_element("#{access_type1}": access_name1.to_s) }.location
    start_x = ele_from.x
    start_y = ele_from.y

    # to get end x,y co-ordinates
    ele_to = wait_for { $driver.find_element("#{access_type2}": access_name2.to_s) }.location
    end_x = ele_to.x
    end_y = ele_to.y

    swipe(start_x, start_y, end_x, end_y)
  end

  def swipe(start_x, start_y, end_x, end_y)
    action = Appium::TouchAction.new.press(x: start_x.to_s, y: start_y.to_s).wait(1000).move_to(x: end_x.to_s, y: end_y.to_s).release
    action.perform
  end

  def self.swipe_direction(direction)
    size = $driver.manage.window.size
    p size
    height = size.height.to_i - 10
    width = size.width.to_i - 10
    case direction
    when 'right'
      start_x = (width / 100) * 15 # 83
      start_y = height / 2 # 695
      end_x = (width / 100) * 90 # 900
      end_y = height / 2 # 630
    when 'left'
      start_x = (width / 100) * 90
      start_y = height / 2
      end_x = (width / 100) * 15
      end_y = height / 2
    when 'up'
      start_x = width / 2
      start_y = (height / 100) * 60
      end_x = width / 2
      end_y = (height / 100) * 45
    when 'down'
      start_x = width / 2
      start_y = (height / 100) * 70
      end_x = width / 2
      end_y = (height / 100) * 85
    when 'long up'
      start_x = width / 2
      start_y = (height / 100) * 80
      end_x = width / 2
      end_y = (height / 100) * 20
    else
      raise 'invalid direction'
    end

    swipe(start_x, start_y, end_x, end_y)
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
  def self.swipe_element_with_direction(access_type, access_name, direction)
    retries = 0
    begin
      ele_from = wait_for { $driver.find_element("#{access_type}": access_name.to_s) }.location
      p ele_from
      x_start = ele_from.x
      y_start = ele_from.y

      ele_size = wait_for { $driver.find_element("#{access_type}": access_name.to_s) }
      ele_height = ele_size.size.height.to_i
      ele_width =  ele_size.size.width.to_i

      x_end = x_start + ele_width
      y_end = y_start + ele_height

      puts "[#{x_start},#{y_start}],[#{x_end},#{y_end}]"

      puts "ele_height : #{ele_height}" # 1776
      puts "ele_width :#{ele_width}" #

      size = $driver.manage.window.size
      height = size.height.to_i - 5
      puts "height : #{height}" # 1776
      width = size.width.to_i - 5
      puts "width :#{width}"
      case direction
      when 'right'
        start_x = x_start + (ele_width * 0.25)
        start_y = y_start + (ele_height / 2)
        end_x = width # 900
        end_y = y_start + (ele_height / 2)
      when 'left'
        start_x = x_end - 5
        start_y = y_end - (ele_height / 2)
        end_x = 10
        end_y = y_end - (ele_height / 2)
      when 'up'
        ele_height = height if ele_height > height

        y_end = y_start + ele_height if y_end > height

        puts "ele_height: #{ele_height}"
        puts "ele_height*).75: #{ele_height * 0.75}"
        puts y_end
        start_x = x_end - (ele_width / 2)

        start_y = y_end - (ele_height * 0.75)

        if start_y.negative?
          y_start = 0
          y_end = y_start + ele_height
          start_y = y_end - (ele_height * 0.75)
        end

        end_x = (x_end / 2)
        end_y = 10
      when 'down'
        start_x = x_start + (ele_width / 2)
        ele_height = height if ele_height > height
        start_y = y_start + (ele_height * 0.25)
        if start_y.negative?
          y_start = 0
          ele_height = height if ele_height > height
          start_y = y_start + (ele_height * 0.25)
          puts "ele_height: #{ele_height}"
          puts "ele_height*0.25: #{ele_height * 0.25}"
        end
        end_x = x_start + (ele_width / 2)
        ele_height = height if ele_height > height
        end_y = ele_height
      else
        raise 'invalid direction'
      end

      puts "start_x: #{start_x}, start_y: #{start_y}"
      puts "end_x: #{end_x}, end_y: #{end_y}"

      swipe(start_x, start_y, end_x, end_y)
    rescue Exception => e
      retry if (retries += 1) < 3
      raise e.message if retries == 3
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength

  def swipe_coordinates_with_direction(start_x, start_y, direction)
    size = $driver.manage.window.size
    height = size.height.to_i - 5
    puts "height : #{height}"
    width = size.width.to_i - 5
    puts "width :#{width}"
    case direction
    when 'right'
      start_x = start_x
      start_y = start_y
      end_x = width
      end_y = start_y
    when 'left'
      start_x = start_x
      start_y = start_y
      end_x = 10
      end_y = start_y
    when 'up'
      start_x = start_x
      start_y = start_y
      end_x = start_x
      end_y = 10
    when 'down'
      start_x = start_x
      start_y = start_y
      end_x = start_x
      end_y = height
    else
      raise 'invalid direction'
    end

    swipe(start_x, start_y, end_x, end_y)
  end

  def swipe_to_section(direction, section)
    Timeout.timeout(90) do
      BaseHelper.swipe_direction(direction) until $driver.find_elements(:xpath, "//android.widget.TextView[@text='#{section}']").empty? == false
    end
  end
end
World(BaseHelper)
# rubocop:enable Metrics/ModuleLength
