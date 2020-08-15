require 'json'
require 'onebox' # available from common-gems layer

def preview(event:, context:)
  body = JSON.parse(event['body'], symbolize_names: true)
  url = body[:url]

  # turning URL into a website preview
  preview = Onebox.preview(url)

  {
    statusCode: 200,
    body: {
      preview: preview.to_s,
    }.to_json
  }
end
