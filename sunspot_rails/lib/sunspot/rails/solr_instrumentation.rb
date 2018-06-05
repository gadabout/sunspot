module Sunspot
  module Rails
    module SolrInstrumentation
      extend ActiveSupport::Concern

      included do
        alias_method :send_and_receive_without_as_instrumentation, :send_and_receive
        alias_method :send_and_receive, :send_and_receive_with_as_instrumentation
      end

      def send_and_receive_with_as_instrumentation(path, params={}, *extra)
        ActiveSupport::Notifications.instrument("request.rsolr",
                                                {:path => path, :parameters => params}) do
          execute_without_as_instrumentation(path, params, *extra)
        end
      end
    end
  end
end
