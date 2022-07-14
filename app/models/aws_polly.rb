# require 'aws-sdk-core'
# def polly

# client = Aws::Polly::Client.new(
#     region: 'us-west-2',
#     credentials: Aws::Credentials.new(ENV['amazon_polly_key_id'], ENV['amazon_polly_secret_access_key'])
# )
# client.synthesize_speech(output_format: 'mp3', text: 'hello', voice_id: 'Joanna')
