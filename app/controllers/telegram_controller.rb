class TelegramController
  require 'telegram/bot'

  #set webhook: https://api.telegram.org/bot312368012:AAEFMXtH_wML296i--uBr5C9cLKgDyqYxiI/setWebhook?url=<ngrok https address>/webhooks/telegram_<32 character random token>

  token = '312368012:AAEFMXtH_wML296i--uBr5C9cLKgDyqYxiI'

  Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
      case message.text
      when '/location'
        bot.api.send_location(chat_id: message.chat.id, latitude: 37.566535, longitude: 126.977969)
      when '/start'
        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}. Can you send me your '/location' so I can better help you?")
      when '/stop'
        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
      end
    end
  end
end
