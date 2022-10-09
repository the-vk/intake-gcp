# frozen_string_literal: true

require 'intake'
require 'stackdriver'

module Intake
  module GCP
    # An Intake sink that writes to GCP Cloud Logging
    class GCPSink < Intake::Sink
      def initialize(log_name:, resource_id:)
        super()
        @log_name = log_name
        @logging = Google::Cloud::Logging.new
        @writer = @logging.async_writer
        @resource = @logging.resource resource_id
      end

      # rubocop:disable Metrics/MethodLength
      def drain(event)
        entry = @logging.entry(
          timestamp: event.timestamp,
          log_name: @log_name,
          resource: @resource,
          severity: LEVEL_MAP.fetch(event.level.name, :DEFAULT),
          payload: event.message,
          labels: event.data.dup.merge!({
                                          logger_name: event.logger_name
                                        })
        )

        @writer.write_entries entry
      end
      # rubocop:enable Metrics/MethodLength

      LEVEL_MAP = {
        debug: :DEBUG,
        info: :INFO,
        warn: :WARNING,
        error: :ERROR,
        fatal: :CRITICAL
      }.freeze
    end
  end
end
