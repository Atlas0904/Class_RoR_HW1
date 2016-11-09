1. 請解釋 database.yml, routes.rb, 和 Gemifle 分別是什麼？ 他們分別在一個 Rails 專案裡的什麼位置？ 他們為什麼對一個 Rails 專案如此重要？  
Ans:    
  ```
  config/database.yml: 資料庫設定檔。 Rails 應用程式會與資料庫互動。這個檔案包含三個不同的部分，對應到三個 Rails 預設環境
  config/routes.rb: 定義頁面路由的檔案，負責將瀏覽器送來的http request 解析，配送至對應的controller action方法中
  ./Gemfile: Gemfile是我們創建的一個用於描述gem之間依賴的文件。gem是一堆Ruby代碼的集合,   可以將 project 會用到的 gem 定義在這邊
  Ref:http://charlene-blog.logdown.com/posts/711773-railsrouting-namespace
  ```

2. MVC 架構裡的 M, V, 和 C 分別代表什麼？   
Ans:    
  Model, View, Controller

3. 請解釋 CRUD 是哪四個字的縮寫？    
Ans:    
  Create 
  Read
  Update
  Delete

4. 請問在 routes.rb 裡面加入以下程式碼會產生出哪一些 url？ (提示：在 browser 輸入```http://localhost:3000/rails/info/routes```)
    ```ruby
    resources :users
    ```
Ans:    
http://localhost:3000/users/

5. 請解釋 model 檔案和 migration 檔案的差別  
Ans:    
  model: 用來定義 Database class 間相互的關係 1-many, many-1, many-many
  migration: migration 用來記錄每一筆資料庫的變更, 之後執行 rake db:migrate apply

6. 若今天發現一個 migration 檔寫錯，請問我應該用什麼指令回復到上一個版本的 migration    
Ans:    
    ```ruby
    rake db:rollback
    ```

7. 假設今天
    * 我要在資料庫裡產出一個叫 group 的資料表
    * 裡面包括的欄位名稱和相對應的資料型別是：  
        **name (string)**,
        **description (text)**,
        **members (integer)**    

   請寫出一個能產生出以上需求的 migration 檔    
Ans:    
  ```ruby
  class AddMemberTable < ActiveRecord::Migration
    def change
      create_table :group do |t|
        t.string  :name
        t.text    :description
        t.integer :members

        t.timestamp
      end
    end
  end
  ```

8. 請解釋什麼是 ActiveRecord?    
Ans:   
翻譯官的腳色, 用來串接以方便使用者即使不知道Database語法 也可以對資料庫做 CRUD 的command

9. 若今天需要為 ```Project``` 和 ```Issue``` 這兩個 Model 建立一對多的關係，請寫出實作上所需要的 migration 和 model 檔案    
Ans:    
```ruby
$rails g migration add_projects_table
$rails g migration add_issues_table

class AddProjectsTable < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      //data member
 
      t.timestamps
    end    
  end
end

class AddIssuesTable < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      //data member
 
      t.timestamps
    end    
  end
end

$rake db:migrate

class Project < ActiveRecord::Base
  has_many :issues
end
```

10. 若今天我有以下 model 檔：

  ```ruby
  class User < ActiveRecord::Base
    has_many :groups_users
    has_many :groups, through: :groups_users 
  end
  ```

  請寫出和這個 model 檔相關連的 model 檔，以及這些 model 檔所需要的資料庫欄位  
Ans:    
  ```ruby
  class CreateUserGroup < ActiveRecord::Migration
    def change
      create_table :users do |t|
        t.string  :name
        t.timestamps null: false
      end
   
      create_table :groups do |t|
        t.string  :name
        t.timestamps null: false
      end

      create_table :group_users do |t|
        t.belongs_to :groups, index: true
        t.string  :name
        t.timestamps null: false
      end
    end
  end

  class GroupUser < ActiveRecord::Base
    belongs_to :user
  end
  class Group < ActiveRecord::Base
    has_many :user
  end
  ```

11. 延續第10題，如果需要讓一個叫 "Bob" 的使用者產生一個名字叫做 "Rails is Fun" 的社團，應該如何在 rails console 裡實作出來？    
Ans:    
```ruby
bob = User.new(name: "Bob")
rail = Group.new(name: "Rails is Fun")
bob.group << rail
```
12. 延續第11題，請寫一段程式碼確保使用者在建立新社團時社團名不可以是空白，而且不能超過50個字    
Ans:    
```ruby
class Group < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { maximum: 50 }
  has_many :user
end
```
