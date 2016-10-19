1. 請說明 Fixnum (整數) 和 Float (浮點數) 之間的差異<br/>
    Answer:
    Fixnum 和 Fixnum 運算後還是 Fixnum
    Float 與 Fixnum or Float 運算會轉換成 Float

2. 今天有兩個字串：
  ```ruby 
  str1 = "Hallo Welt!" 
  str2 = " NTU Rails 261!"
  ```
請說明以下兩個印出字串的方式的不同處：
  ```ruby
  puts str1 + str2
  puts "#{str1}#{str2}"
  ```
    Answer:
    puts str1 + str2: 產生新的 string 放到新的記憶體 str3, 在 output 出來
    puts "#{str1}#{str2}": runtime output string 不佔用額外記憶體
    Ref: http://greyblake.com/blog/2012/09/02/ruby-perfomance-tricks/


3. 請解釋 array 和 hash 的不同處 :

    Answer:
    Array index 只能是 integer, 根據 index 取值
    Hash key-value pair, 根據 key 取值, key 可以是 arbitrary object type

4. 請用一行程式碼從 [1, "a string", 3.14, [1,2,3,4]] 這個陣列找出所有非字串的值:

    Answer:
    ```ruby
    [1, "a string", 3.14, [1,2,3,4]].reject {|x| (x.is_a? String)}
    ```

5. 請用一行程式碼把一個內容為整數 1 到 100 的陣列裡所有的值加上 2

    Answer:
    ```ruby
    (1..100).to_a.map {|x| x+=2}
    ```
6. 請寫出以下兩行程式碼迴傳的值，並解釋他們呼叫的方法差別為何：
  ```ruby
  [1, 2, 3, 3].uniq
  [1, 2, 3, 3].uniq!
  ```
  
    Answer:
    這個 case 結果是一樣的 [1,2,3]
    但 uniq 會new新的 array 而且裡面的 element 是沒有重複的
    但 uniq! 會對同一個 array增減
    另外 note [1, 2, 3, 3].uniq!.uniq! 兩次 會 return nil [1, 2, 3, 3].uniq.uniq 還是 [1,2,3]  

7. 請列出兩種產出亂數的方法

    Answer:
    ```ruby
    a. Random.rand(1..10)
    b. (1..100).to_a.sample
    c. (1..100).to_a.shuffle!.first
    ```

8. 以下這段程式碼：
  ```ruby
  ((1 > 3)&&(true == true))||(!!!false)
  ```
  會執行出什麼結果？ 請試試不用 irb 算出結果
  
    Answer:
    ```ruby
    = ((false) && (true) || true)
    = true
    ```

9. 請問 binding.pry 是什麼？ 要如何使用它？

    Answer:
    類似break point, 可先安裝 pry 這個 gem, 讓程式在 runtime 的時候可以monitor variable值, 幫助除錯

10. 下面的一段程式碼，請嘗試用其他方法把 if...else...end 簡化成一行
  ```ruby
  var = 5

  if var >= 5
    return "var is greater than or equal to 5"
  else
    return "var is less than 5"
  end
  ```

    Answer:
    ```ruby
    return (var>=5) ? "var is greater than or equal to 5" : "var is less than 5"
    ```

11. 請列出兩種不同的 hash 寫法
    
    Answer:
    * 類似 JSON
    ```ruby
    Human = {
        name: "Atlas",
        age: 31
    }
    ```

    * HashRocket
    ```ruby
    Human = {
        :name => "Atlas",
        :age => 31
    }
    ```
Quiz from:
<https://github.com/yuyueugene84/ntu_ror_268_quiz1/blob/master/quiz1.md>
