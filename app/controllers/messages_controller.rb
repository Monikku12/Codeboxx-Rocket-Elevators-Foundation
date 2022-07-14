class MessagesController < ApplicationController


    def patate
        puts "-------------"
        client = Aws::Polly::Client.new(
            region: 'us-west-2',
            credentials: Aws::Credentials.new(ENV['amazon_polly_key_id'], ENV['amazon_polly_secret_access_key'])
            #credentials: Aws::Credentials.new("AKIAXN4KA6BHSPIGBQO5", "J7wjLQarfoGO8ZzXl0SaFeEf95aMFozrXvCrLACX")
        )


        puts client
        result = client.synthesize_speech(output_format: 'mp3', text: 'hello', voice_id: 'Joanna')
        send_data result.audio_stream.read, type: 'audio/mpeg', disposition: 'inline'
        
        puts client
        puts "-------------"
        
    end
end
  