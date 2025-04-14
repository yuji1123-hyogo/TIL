# 変換された値 = 変換前の値 * 変換比率 で表せる
# 変換比率 = 変換後の単位の1mに対応する値/変換前の単位の1mに対応する値
def convert_length(length,unit_from: :m,unit_to: :in)
    
    each_unit_value_per_meter= {
        m:1,
        ft:3.28,
        in:39.37
    }  

    converted_length = length * each_unit_value_per_meter[unit_to]/each_unit_value_per_meter[unit_from]
    puts converted_length.round(2)
    converted_length.round(2)
end

each_unit_value_per_meter= {
    m:1,
    ft:3.28,
    in:39.37
}  


# 問題1: ハッシュとシンボルの基本操作
# 買い物かごの商品を管理する簡単な関数を作成してください。

# 以下の関数を実装してください
# 1. 空の買い物かごを作成する関数 
def create_cart()
    Hash.new{|h,key| h[key] = 0}
end

empty_cart = create_cart()
p '買い物かご',empty_cart


# 2. 商品を追加する関数 add_item(cart, item_id, quantity: 1)
def add_item(cart,item_id,quantity:1)
    cart[item_id] += quantity
end

add_item(empty_cart,001,quantity:3)

p "id:001の商品が追加された買い物かご",empty_cart

# 3. 商品を削除する関数 remove_item(cart, item_id)
def remove_item(cart, item_id)
    cart.delete(item_id)
end

# remove_item(empty_cart, 001)
p "id:001の商品が削除された買い物かご",empty_cart

# 4. カート内の合計数量を計算する関数 total_items(cart)
def total_items(cart)
    cart.values.sum
end

p "カート内の商品の合計点数",total_items(empty_cart)

# 5. カートの内容を整形して返す関数 format_cart(cart)

def format_cart(cart)
    formated_cart = []
    cart.each do |key,value|
        formated_cart  << "商品ID:#{key} :#{value}個" 
    end
    p formated_cart
end

p "買い物かご内容:"
format_cart(empty_cart)
p "カート内の商品の合計点数:",total_items(empty_cart)


# 問題2: キーワード引数とハッシュの変換
# ユーザーデータを管理する関数を作成してください。
# 以下の関数を実装してください
# 1. create_user(name:, email:, age: nil, active: true)
#    - 名前とメールは必須引数
#    - 年齢とアクティブ状態はオプション引数（デフォルト値あり）
#    - ユーザー情報をハッシュとして返す


def create_user(name:, email:, age: nil, active: true)
    user_data = Hash.new { | h,key | h[key] = nil }
    user_data[:name] = name
    user_data[:email] = email
    user_data[:age] = age
    user_data[:active] = active
    user_data
end

user_a = create_user(name:"yuji",email:"xxx@gmail.com")
p user_a


# 2. update_user(user, **attributes)
#    - 既存のユーザーハッシュと更新したい属性を受け取る
#    - ユーザーハッシュを更新して返す
def update_user(user, **attributes)
    updateduser = user.merge(attributes)
end


p update_user(user_a,email:"2")
    


# 問題3: ハッシュのデフォルト値とシンボル
# 単語の出現回数をカウントする関数を作成してください。
# 以下の関数を実装してください
text_list = ["aaplle","aaplle","aaplle","aaplle","lemon","lemon","lemon","lemon","glape","lemon","lemon","lemon","lemon","chery","chery","chery","chery","chery","chery","chery","chery"]
# 1. count_words(text)
#    - テキスト内の各単語の出現回数をカウントする
#    - 結果をハッシュ（単語 => 出現回数）で返す
#    - Hash.newを活用して実装する

def count_words (text)
    hash = Hash.new{ | h,key| h[key] = 0 }
    text.each do |word|
        hash[word] += 1
    end
    hash
end

answer = count_words(text_list)
p answer

# 2. find_most_common(word_counts, limit: 3)
#    - 出現回数の多い単語を指定した数だけ返す
#    - 結果は [{word: "単語", count: 出現回数}] の形式の配列
#    - キーワード引数limitでデフォルト値3を設定
def find_most_common(word_counts, limit: 3)

    top_words_array = []
    sorted_hash = word_counts.sort_by do |key,value|
        - value
    end
    sorted_hash.first(limit).to_h
end

answer2 = find_most_common(answer,limit:2)
p answer2

# 3. filter_words_by_count(word_counts, min: nil, max: nil)
#    - min以上max以下の出現回数を持つ単語を抽出
#    - オプショナルな引数min, maxを活用


def filter_words_by_count(word_counts, min: nil, max: nil)
    p word_counts
    selected = word_counts.select do |key,value|
         (min..max).include?(value)
    end
    selected
end

p "selected" ,filter_words_by_count(answer,min:1,max:10)
