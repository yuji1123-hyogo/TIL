# Ruby配列とブロックの基礎確認問題
# 喜んでRubyの配列とブロックの知識を確認する問題を用意します。実装を通して基礎が身についているか確認しましょう。以下の問題を解いてみてください：
# 問題1: 配列の基本操作
# 次の配列 numbers = [1, 2, 3, 4, 5] に対して：
numbers = [1, 2, 3, 4, 5]

# 全ての要素に3を掛けた新しい配列を作成してください。(目的の抽象化：要素を加工した新たな配列を生成したいとき⇒map)
a1 = numbers.map do |n| 
    n*3
end
p "a1:",a1


# 偶数だけを抽出した配列を作成してください(抽象化:特定の条件を満たす配列を生成したいとき⇒select
a2 = numbers.select do |n|
    n.even?
end
p "a2:",a2

# 全要素の合計を計算してください
a3 = numbers.sum 
p "a3:",a3



# 問題2: 配列の変換
# 文字列の配列 words = ["apple", "banana", "cherry", "date"] から：
words = ["apple", "banana", "cherry", "date"]
# 各文字列の長さを要素とする新しい配列を作成してください
a4 = words.map do |w| 
    w.length
end
p "a4:",a4

# 5文字以上の単語だけを抽出してください
a5 = words.select do |w|
    w.length >= 5
end
p "a5:",a5

# 各単語を大文字に変換した配列を作成してください
a6 = words.map do |w|
    w.upcase
end
p "a6:",a6


# 問題3: ブロックと集計
# 数値の配列 data = [12, 5, 8, 21, 16, 7, 22, 14] を使って：
data = [12, 5, 8, 21, 16, 7, 22, 14]
# 10より大きい数値の個数を数えてください
a7 = data.select do |n| 
    n > 10
end
p "a7:",a7.length


# 最大値と最小値の差を計算してください
max_data = data.max
min_data = data.min
p "a8:", max_data - min_data


# 偶数と奇数に分けた連想配列（ハッシュ）を作成してください
odd_array = data.select{|n| n.odd? }
even_array = data.select{|n| n.even? }
p odd_array
p even_array

a9 = {
    odd_array:odd_array,
    even_array:even_array
}

p a9


# 問題4: インデックスを使ったブロック処理
# 配列 elements = ["hydrogen", "helium", "lithium", "beryllium"] について：
elements = ["hydrogen", "helium", "lithium", "beryllium"]
# インデックスと要素を組み合わせた文字列の配列を作成してください（例: "0: hydrogen"）
a10 = elements.map.with_index {|e,i| "#{i}:#{e}"}
p a10
# インデックスが偶数の要素だけを抽出してください
a11 = elements.select.with_index {|e,i| i%2==0 }
p a11

# 各要素の最初の文字を大文字にした配列を作成してください
a12 = elements.map{|n| n.capitalize}
p a12


# 問題2: インデックスと要素の活用
# 配列 colors = ["red", "blue", "green", "yellow", "purple"] について：
colors = ["red", "blue", "green", "yellow", "purple"] 
# 各要素とそのインデックスを使って「0番目はred」のような文字列の配列を作成してください
a13 = colors.map {|n,i| "#{i}番目は#{n}"}
# 奇数インデックスの要素だけを抽出してください
a14 = colors.select.with_index{|n,i| i.even?}
p "a14",a14


# 各要素の長さに基づいて並べ替えた配列を作成してください（短い順）
a15 = colors.sort_by {|n| n.length}

p "a15",a15


# 問題3: 数値配列の処理
# 配列 data = [14, 35, 7, 22, 19, 42, 8, 16] を使って：
data = [14, 35, 7, 22, 19, 42, 8, 16] 
# 配列の前半と後半で別々に合計を計算し、両方の値を要素とする新しい配列を返してください
zenhan = data[0...data.length/2].sum
kouhan = data[data.length/2..data[-1]].sum

a16 = [zenhan,kouhan]
p "a16:",a16

# 問題4: 文字列配列の処理
# 配列 fruits = ["apple", "banana", "strawberry", "kiwi", "pineapple"] について：
fruits = ["apple", "banana", "strawberry", "kiwi", "pineapple"] 
# 文字「a」を含む要素だけを抽出してください
a17 = fruits.select{ |n| n.include?("a")}
p a17

# 各要素の文字数を数えて、文字数の多い順に並べ替えた元の配列を返してください
a18 = fruits.sort_by{|n| -n.length}
p a18

# 問題5: 配列の絞り込みと条件処理
# 配列 scores = [85, 92, 63, 78, 95, 42, 87, 91, 69, 81] について：
scores = [85, 92, 63, 78, 95, 42, 87, 91, 69, 81]
# 合格（60点以上）・不合格（60点未満）を判定し、「[点数]は合格です」または「[点数]は不合格です」という文字列の配列を作成してください
a19 = scores.map{|n| n > 60 ? "[#{n}]は合格です" : "[#{n}]は不合格です"}
p a19


# 最高点と最低点を除いた平均点を計算してください
new_array = scores.reject {|n| n == scores.max || n== scores.min}
puts new_array.sum.to_f / new_array.size


# 問題6: 配列の中の配列（二次元配列）
# 二次元配列 grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] について：
grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] 
# 各行の合計値からなる新しい配列を作成してください
a20 = grid.map{|a| a.sum}
p a20


# 全ての偶数要素だけを含む一次元配列を作成してください
a21 = grid.flatten.select{|n| n.even?}
p a21

# 対角線上の要素（1, 5, 9）を抽出した配列を作成してください
a22 = grid.map.with_index {|n,i| n[i]}
p a22


# 問題7: 条件付き繰り返し
# 配列 values = [3, 8, 12, 6, 10, 5, 22, 15, 9, 7] について：
values = [3, 8, 12, 6, 10, 5, 22, 15, 9, 7]
# 初めて見つかった10より大きい値のインデックスを返してください
a23 = values.find{|n| n > 10}
puts values.index(a23)

# 合計が30を超えるまで先頭から要素を足していき、その時点での部分配列を返してください
sum = 0
index = 0

until sum > 30
    sum += values[index]
    index += 1
end

puts sum
p values[0...index]


# 配列の中で隣り合う2つの要素がともに偶数になる最初のペアを見つけ、それらを要素とする配列を返してください
flag = 0
start_index = 0

values.each.with_index do |n,i| 
    if n.even? && flag == 0
        flag = 1
        start_index = i
        puts n
    elsif n.even? && flag == 1
        puts n
        break
    else 
        flag = 0
        puts n
    end
end

p values[start_index,start_index+1]

# 問題1: 特定条件での繰り返し終了（break）
# 配列 numbers = [5, 12, 8, 21, 3, 7, 14, 9, 16, 11] があります。先頭から順に処理し、合計が30を超えたらその時点で処理を終了するプログラムを作成してください。
numbers = [5, 12, 8, 21, 3, 7, 14, 9, 16, 11]
sum = 0
index = 0
while sum < 30
    sum += numbers[index]
    index += 1
end
# 合計が30を超えるまでに加算された要素の配列を返してください
p numbers[0...index]
# 合計値も表示してください
p sum
# 何番目の要素で終了したかも表示してください
p index
# 問題2: 条件に合わない要素のスキップ（next）
# 配列 words = ["programming", "ruby", "python", "code", "algorithm", "debug", "function"] があります。各要素に対して以下の処理を行うプログラムを作成してください。
words = ["programming", "ruby", "python", "code", "algorithm", "debug", "function"]
# 5文字未満の単語はスキップしてください
# 処理されたすべての単語を大文字に変換し、各単語の長さと一緒に「単語:文字数」という形式で出力してください
# 最終的に何個の単語が処理されたかを表示してください

total = 0
words.each do |n|
    next if n.length < 5  
    puts "#{n}:#{n.length}"
    total += 1
end

puts total




# 問題3: 特定パターンの検出（複合条件）
# 配列 sequence = [2, 5, 8, 3, 6, 9, 12, 15, 7, 10, 4, 8] があります。以下の条件を満たす部分配列を検出するプログラムを作成してください。
sequence = [2, 5, 8, 3, 6, 9, 12, 15, 7, 10, 4, 8] 
# 連続する3つの要素が「すべて偶数」または「すべて奇数」の場合、その部分配列を検出してください
# 検出した部分配列をすべて出力してください（複数ある場合は全て）
# 各パターンが「偶数パターン」か「奇数パターン」かも表示してください
# パターンが見つからない場合は「パターンが見つかりませんでした」と表示してください


finded_pattern = 0
sequence.each_cons(3) do |a,b,c| 
    if a.even? && b.even? && c.even?
        p "#{[a,b,c]}偶数"
        finded_pattern = 1
    elsif a.odd? && b.odd? && c.odd?
        p "#{[a,b,c]}奇数"
        finded_pattern = 1
    end
end

if finded_pattern == 0 
    p "パターンが見つかりませんでした"
end