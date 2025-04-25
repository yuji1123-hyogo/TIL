# Rubyのクラスとオブジェクトについての実戦形式の基礎レベル問題を提供いたします。各問題にはキーワードと回答の目安時間を記載しています。

# ##################### 問題1: 銀行口座クラスの実装###############################
# **キーワード**: クラス定義、インスタンス変数、メソッド定義、アクセサ
# **回答目安時間**: 15分

# 銀行口座を表す`BankAccount`クラスを作成してください。

# 要件:
# - 口座番号、所有者名、残高を保持できる
# - 残高は外部から直接変更できない
# - 入金・出金のメソッドを実装する
# - 出金時に残高不足の場合はエラーメッセージを表示する
# - 現在の残高を表示するメソッドを実装する

# 入出力例
# # 口座を作成
# account = BankAccount.new("123456", "山田太郎", 1000)
# # 残高確認
# puts account.balance_info
# # => "現在の残高は1000円です"
# # 入金
# account.deposit(500)
# puts account.balance_info
# # => "現在の残高は1500円です"
# # 出金（成功）
# account.withdraw(300)
# puts account.balance_info
# # => "現在の残高は1200円です"
# # 出金（失敗）
# account.withdraw(2000)
# # => "エラー: 残高が足りません" 

#################解答編#######################################

class BankAccount 
  attr_reader :account_number,:owner_name,:balance
 def initialize(account_number,owner_name,balance)
  @account_number = account_number
  @owner_name = owner_name
  @balance = balance
 end

 def balance_info
  "現在の残高は#{@balance}円です"
 end

 def deposit(amount)
  if amount < 0
    puts "エラー：入金は整数である必要があります"
  else
    @balance += amount
  end
 end

 def withdraw(amount)
  if @balance - amount <0
    puts "エラー:残高が足りません"
  else
    @balance -= amount
  end
 end
end

account = BankAccount.new("123456", "山田太郎", 1000)
puts account.balance_info
account.deposit(500)
puts account.balance_info
puts account.balance
account.withdraw(300)
puts account.balance_info
account.deposit(-100)
account.withdraw(100000)



#####認識のブラッシュアップ##########

########確認########
# attr_readerならクラス外部から属性の読み込みは可能。書き換えは禁止される
# attr_accessorなら読み込みと書き換えの両方が可能である
# インスタンス変数はクラス内で基本的に@変数名の形で扱う。しかしながらなぜかアクセサ修飾子ではシンボルの形で扱う

########是正#######
# メソッドの引数定義時はシンボル使わない(普通の引数か、keyword引数か)

#######新たな知識#######
#例外処理とif-else
# 例外処理は予測不可能な結果に対しての[対処]
# 予測できる結果に対しての[予防]はif-else





# ############## 問題2: 商品在庫管理システム ###########################
# **キーワード**: クラス継承、オーバーライド、ポリモーフィズム
# **回答目安時間**: 20分

# 商品在庫管理システムを実装してください。
# 要件:
# - `Product`を親クラスとし、`Food`と`Electronics`を子クラスとして実装
# - すべての商品は共通の属性として名前、価格、在庫数を持つ
# - `Food`クラスは追加で賞味期限を持つ
# - `Electronics`クラスは追加で保証期間を持つ
# - 各クラスで`display_info`メソッドをオーバーライドして商品情報を表示する
# - 在庫管理用の`Inventory`クラスを作成し、複数の商品を登録・検索できるようにする

# 商品インスタンスを作成
# apple = Food.new("りんご", 120, 10, "2025-01-01")
# tv = Electronics.new("テレビ", 50000, 5, "2年間")
# # 商品情報の表示
# apple.display_info
# # => 商品名: りんご / 価格: 120円 / 在庫: 10個 / 賞味期限: 2025-01-01
# tv.display_info
# # => 商品名: テレビ / 価格: 50000円 / 在庫: 5個 / 保証期間: 2年間
# # 在庫管理システムに登録
# inventory = Inventory.new
# inventory.add_product(apple)
# inventory.add_product(tv)
# # 全商品の一覧表示
# inventory.list_all
# # => 上記2つの商品情報が表示される
# # 商品名で検索
# found = inventory.find_by_name("りんご")
# found.display_info
# # => 商品名: りんご / 価格: 120円 / 在庫: 10個 / 賞味期限: 2025-01-01

###########解答編##################
#

class Product
  attr_reader :name 

  def initialize(name,price,stock)
    @info = {}
    @name = name
    @info[:name] = name
    @price = price
    @info[:price] = price
    @stock = stock
    @info[:stock] = stock
  end

  def display_info
    puts @info.map{|key,value| "#{key}:#{value}"}.join("/")
  end
end


class Food < Product
  def initialize(name,price,stock,best_before)
    super(name,price,stock)
    @best_before = best_before
    @info[:best_before] = best_before
  end

end


class Electronics < Product
  def initialize(name,price,stock,warranty_period)
    super(name,price,stock)
    @warranty_period = warranty_period
    @info[:warranty_period] = warranty_period
  end
end

class Inventory
  def initialize
    @item_list = []
  end

  def add_product(item)
    @item_list << item
  end

  def list_all
    @item_list.each {|item| item.display_info}
  end

  def find_by_name(product_name)
    @item_list.find {|item| item.name == product_name}
  end
end



product = Product.new("aaa",111,1)
product.display_info

food = Food.new("aaa",1111,111,"11/22")
food.display_info

electronics = Electronics.new("baja",1212,12,"3年")
electronics.display_info

inventory = Inventory.new
inventory.add_product(food)
inventory.add_product(electronics)
inventory.list_all
inventory.find_by_name("baja")



#むずかしいところ
#配列、ハッシュの適切なデータ構造の選択
#インスタンス変数、クラス変数の性質理解と使い分け

#####認識のブラッシュアップ#########
#確認

#是正

#新たな知識
#すべてのオブジェクトをまとめて管理する集約用のオブジェクトがあると扱いやすい


# ✅ 問題①：ユーザーと記事の関係をクラスで表現しよう
# キーワード：has-many, 配列, 関連付け, 表示メソッド, 責務の分離
# 所要時間目安：20分

# 🔹 内容：
# 以下の関係をクラスで表現し、記事一覧をユーザーごとに出力できるようにせよ。

# User クラス（名前と複数の記事を持つ）

# Article クラス（タイトルと内容と投稿者名を持つ）

# 🔹 使用例（出力例）：
# ruby
# コピーする
# 編集する
# user = User.new("山田太郎")
# user.add_article(Article.new("Ruby入門", "オブジェクト指向とは..."))
# user.add_article(Article.new("Rails超入門", "ルーティングについて..."))
# user.show_articles
# =>
# 山田太郎さんの記事一覧:
# - Ruby入門
# - Rails超入門



############解答編#################
class User 
  attr_reader :name,:articles
  def initialize(name)
    @name = name
    @articles = []
  end

  def add_article(article)
    @articles << article
    article.add_author(@name)
  end
  def show_articles
    puts @articles
  end
end


class Article
  def initialize(title,content)
    @title = title
    @content = content
  end
  def add_author(author)
    @author = author
  end
end


article = Article.new("ruby","rubyとは....")
yamada = User.new("yamada")
yamada.add_article(article)


yamada.show_articles

# インスタンスメソッド内で他のインスタンスの属性が必要な時はその属性にアクセサ修飾子をつけて公開しておくとよい