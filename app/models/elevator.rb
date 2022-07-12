require 'slack-notifier'
class Elevator < ApplicationRecord
    belongs_to :column
    after_update :hello

    def hello
        puts '---------------'
        puts 'hello'
        puts '---------------'

        notifier = Slack::Notifier.new ENV['slack_key']
        notifier.ping "The Elevator #{id} with Serial Number #{serial_number} changed status from #{status_before_last_save} to #{status} "
    end    

    # def do_something
    #     puts '------does it work ?------'
    #     ENV['slack_key']
    #     notifier = Slack::Notifier.new "https://hooks.slack.com/services/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L"
    #     notifier.ping "Hello World"
    # end  

end
 