# frozen_string_literal: true

require 'intake'

require_relative '../lib/intake-gcp'

Google::Cloud.configure do |config|
  config.project_id = '' # Set to GCP project Id
  config.keyfile    = '' # Set to path to a service account key file
end

sink = Intake::GCP::GCPSink.new(log_name: 'sample_logger', resource_id: 'gae_app')
Intake.add_sink(sink)

log = Intake[:root]
log.level = :debug

log.debug 'debug message'
log.info 'info message'
log.warn 'warn message'
log.error 'error message'
log.fatal 'fatal message'

sleep 60
