## Книжный клуб

Веб-приложение для, выкладывания книг.
Залогиненным пользователям можно выкладывать книги, описание к ним + комментарии.

### Список нужных гемов

```ruby 
 gem 'rails', '4.2.7.1'
 
 gem 'devise'
 gem 'devise-i18n'
 gem 'russian'
 
 gem 'twitter-bootstrap-rails'
 
 gem 'jquery-rails'
 
 gem 'carrierwave'
 
 gem 'rmagick'
 
 gem 'fog-aws'
 
 group :development, :test do
   gem 'sqlite3'
   gem 'byebug'
 end
 
 # для работы на heroku
 group :production do
   gem 'pg'
   gem 'uglifier'
 end
 ```
 
 *Чтобы установить гемы, выполните команду:*  
 `bundle install --without production`