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
  class variable: @@var, 在最外層宣告, 可以直接用
  instance variable: @var, 通常宣告在 initialize, 需要 getter, setter 方法

4. 請說明 class method 和 instance method 之間的差別
Ans:
  class method: prefix self before method, 直接透過 class.method 不用 new 物件
  instance method: 需要 new 物件才能宣告
  
  ```ruby
  class People
    def initialize(name)
      @name=name
    end
    def self.welcome
      puts "Hi"
    end
    def hello
      puts "Hello #{name}"
    end
  end
  
  puts People.welcome  # class method
  
  people = People.new # instance method
  puts people.hello
  ```

5. 如果今天我為一個叫 User 的 class 產生一個新物件的方式是:
  ```ruby
  User.new("Bob", "male", "Engineer")
  ```
請寫出 User class 的 initialize method
Ans:
  ```ruby
  class User
    def initialize(name, gender, occupation)
      @name = name
      @gender = gender
      @occupation = occupation
    end
  end
  ```

6. 在：
  A.  一個 class 裡，method 外面
  B.  一個 class 裡，instance method 裡
  self 分別是指向什麼?
Ans:
  A. 就是 class 本身
  B. method 物件本身

7. attr_accessor 的功能是什麼，它和 attr_reader、attr_writer 之間的差別是什麼？
Ans:
   因為 Ruby 的 class variable default 是沒有辦法被存取的, 所以需要寫一些方法來存讀取
   attr_accessor: ruby 中一個方法的小方法, 可以自動產生 getter, setter 的方法
   attr_reader: 產生 getter
   attr_writer: 產生 setter

8. 請說明 public 和 private method 之間的不同
Ans:
    public: default 就是 public 任何地方都可以存取
    private: 只有 class 內可以使用
    另外常修改到的方法用 private, interface 通常用 public
    PS: 其實 private 還是有方法可以存取 (class_name,send), 詳見下面 link
     Ref: http://kaochenlong.com/2011/07/26/public-protected-and-private-method-in-ruby/

9. 請說明 Inheritance 和 Module 之間的差別，它們分別是用於哪些情況？ 請舉例說明
Ans:
    Inheritance: "Is a"; Module: "has a"
    Ex: 男人是人這個就是屬於 Inheritance, 而"好"男人, "壞"男人分別是一種屬性 這時候就比較適合用 module

10. 若今天有一個 class 有 include 一個 module，他的 parent class 和 sub class 是否可以使用該 module 裡的 method?
Ans:
    Sub class 可以用 parent class 的 module 的方法, parent 不行
    

11. 請間單說明什麼是 Relational Database，什麼是 SQL
Ans:
  Relational Database: 關聯式資料庫，將資料建立一組關係模型，再依此基礎建出系統架構, 對一個表而言具有 Read, Create, Update, Destory 的功能
  SQL: Structural Query Language 用於關聯式資料庫 (Relational Databases) 當中的一種資料庫查詢語言
