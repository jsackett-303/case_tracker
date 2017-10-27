Resque.redis = $redis
Resque.schedule = YAML.load_file(File.join(Rails.root, 'config', 'resque_schedule.yml'))
Resque.logger = Rails.logger
