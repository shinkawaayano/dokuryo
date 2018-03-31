require 'sinatra'
require 'mysql2'

get '/' do
  client = Mysql2::Client.new(host: 'localhost', username: 'root', database: 'booklist', encoding: 'utf8')
  @records = client.query("SELECT * FROM books ORDER BY created_at DESC")
  erb :booklist
end

post '/' do
  client = Mysql2::Client.new(host: 'localhost', username: 'root', database: 'booklist', encoding: 'utf8')

  # 書籍情報の保存
  book_title = params['book_title']
  start_day_month = params['start_day_month']
  start_day_days = params['start_day_days']
  end_day_month = params['end_day_month']
   end_day_days = params['end_day_days']
   memo = params['memo']
  statement = client.prepare('INSERT INTO books (book_title,start_day_month,start_day_days,end_day_month,end_day_days,memo) VALUES(?,?,?,?,?,?)')
  statement.execute(book_title,start_day_month,start_day_days,end_day_month,end_day_days,memo)
  
 
  

  @records = client.query("SELECT * FROM books ORDER BY created_at DESC")

  erb :booklist
end