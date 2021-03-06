require 'pathname'
require 'execjs'

module RailsPixrem
  class Processor
    def initialize(options = {})
      @options = { root_value: '16px' }.merge(options)
    end

    def process(css)
      processor.call('process', css, @options[:root_value])
    end

    private

    def processor
      @processor ||= ExecJS.compile(processor_js)
    end

    def processor_js
      [pixrem_js, process_proxy].join(';')
    end

    def pixrem_js
      @@pixrem_js ||= Pathname(__FILE__).join('../../../vendor/pixrem.js').read
    end

    def process_proxy
      "var process = require('pixrem');"
    end
  end
end
