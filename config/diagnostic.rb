module Av
  class DiagnosticMiddleware
    FILENAME = 'diagnostic.txt'

    def initialize(app)
      @app = app
    end

    def call(env)
      return @app.call(env)
    rescue StandardError => e
      trace = e.backtrace.select{ |l|l.start_with?(Rails.root.to_s) }.join("\n    ")
      msg = "#{e.class}\n#{e.message}\n#{trace}\n"
      File.open(FILENAME, 'a') { |f| f.write msg }
      raise e
    end
  end
end