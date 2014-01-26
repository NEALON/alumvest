class Veritax::TranscriptResult
  attr_reader :message, :document_bytes

  def initialize(opts)
    @code = opts[:error_code]
    @message = opts[:error_message]
    @mime_type = opts[:mime_type]
    @document_bytes = opts[:document_bytes]
  end

  def success?
    @code == 'Success'
  end

  def write_to_file(file)
    IO.binwrite(file, Base64.decode64(document_bytes))
  end
end