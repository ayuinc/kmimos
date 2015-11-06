PDFKit.configure do |config|
  if File.executable? '/app/.apt/usr/local/bin/wkhtmltopdf'
    config.wkhtmltopdf = '/app/.apt/usr/local/bin/wkhtmltopdf'
  end
end
