1. 請用簡單的方式敘述以下每一行程式碼：

  ```ruby 
  a = 1 
  @a = 2
  @@a = 5
  user = User.new
  user.name
  user.name = "Joe"
  ```
Ans:
  ```ruby 
  a = 1
  ```
  宣告一個 local 變數 a 並且給值 1

  ```ruby 
  @a = 1
  ```
  宣告一個 instance 變數 a 並且給值 1
  
  ```ruby 
  @@a = 1
  ```
  宣告一個 global 變數 a 並且給值 1
  
  ```ruby
  user = User.new
  ```
  New 出一個新的 User 並且 assign 到 user 變數
  ```ruby
  user.name
  ``` 
  => 取得 user 的 name 的值
  ```ruby
  user.name = "Joe"
  ```
  => 取得 user 的 name 並且填入 "Joe" 

2. 什麼是 module? 請寫一段程式碼說明一個 class 要如何使用一個 module 裡面的 method?
Ans:
  module 主要為了實現 Ruby 語言的多重繼承
  一個 module 可以被多個 class 引用

  實例如下:
  ```ruby
  module Gamer
    def play_game
      "Play game++"
    end
  end

  class People
    include Gamer
  end

  player1 = People.new.play_game
  ```


3. 請說明 class variable 和 instance variable 之間的差別
Ans:
  

4. 請說明 class method 和 instance method 之間的差別

5. 如果今天我為一個叫 User 的 class 產生一個新物件的方式是:
  ```ruby
  User.new("Bob", "male", "Engineer")
  ```
請寫出 User class 的 initialize method

6. 在：
  A.  一個 class 裡，method 外面
  B.  一個 class 裡，instance method 裡
  self 分別是指向什麼?

7. attr_accessor 的功能是什麼，它和 attr_reader、attr_writer 之間的差別是什麼？

8. 請說明 public 和 private method 之間的不同

9. 請說明 Inheritance 和 Module 之間的差別，它們分別是用於哪些情況？ 請舉例說明

10. 若今天有一個 class 有 include 一個 module，他的 parent class 和 sub class 是否可以使用該 module 裡的 method?

11. 請間單說明什麼是 Relational Database，什麼是 SQL