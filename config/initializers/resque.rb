require 'resque'
require 'resque/server'
require 'resque-scheduler'
require 'resque/scheduler/server'
require 'active_scheduler'	

Resque.redis = Redis.new(YAML.load_file(File.join(Rails.root, '/config/redis.yml')))
Resque.logger = Logger.new(Rails.root.join('log', "#{Rails.env}_resque.log"))