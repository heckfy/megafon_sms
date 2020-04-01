# MegafonSms

MegafonSms - это библиотека для отправки SMS через сервис Мегафона.

## Установка

Выполняем в терминале:

    $ gem install megafon_sms

и подгружаем:

```ruby
require "megafon_sms"
```

## Использование

```ruby
client = MegafonSms::Client.new "login", "password"
client.adapter = :excon # По умочанию Net::HTTP
client.send from: "Site.ru", to: "9776666644", message: "Сообщение"
p client.response if client.failure?
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/heckfy/megafon_sms. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
