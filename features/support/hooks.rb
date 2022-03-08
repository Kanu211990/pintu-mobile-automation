Before do
  @app = InitializeScreens.new
end

After do |scenario|
  scenario = scenario.scenario_outline if scenario.respond_to?('scenario_outline')
  scenario_id = if scenario.respond_to?('scenario_outline')
                  scenario.scenario_outline.cell_values.first
                else
                  scenario.name.split('-')[0].strip
                end
  if scenario.failed?
    screenshot_dir = File.absolute_path('./report')
    snapshot_path = create_path(screenshot_dir, scenario.status, scenario, ENV['platform'])
    retries = 0
    begin
      $driver.screenshot(snapshot_path)
    rescue NoMethodError => e
      retry if (retries += 1) < 3
      raise e.message if retries == 3
    end
    base64_img = Base64.encode64(File.open(snapshot_path, 'r:UTF-8', &:read))
    embed(base64_img, 'image/png;base64')
  end
ensure
  if scenario.source_tag_names.include? '@continue'
    $driver.close_app
    $driver.launch_app
  else
    $driver.start_driver
  end
end

private

def create_path(dir, status, scenario, platform)
  snapshot_dir = dir + "/screenshot/#{platform}"
  FileUtils.mkdir_p(snapshot_dir) unless File.directory?(snapshot_dir)
  snapshot_dir + "/#{status}-#{sanitize_filename(scenario.name)}.png"
rescue StandardError => e
  raise e.message
end

def sanitize_filename(filename)
  filename.gsub!(/[^0-9A-Za-z.\-]/, ' ')
  filename[0..500]
end