
# 🔰 基礎レベル（正規表現の基本構文になじむ）
# 問題1：
# 次の文字列から数字だけをすべて取り出してください。
text = "私の身長は170cm、体重は65kgです。"
def num_pick(text)
    matched_nums = text.scan(/\d+/)
    matched_nums
end
nums_array = num_pick(text)
p nums_array



# 問題2：
# 次の文字列からひらがなだけを取り出してください。
text = "今日はとてもSunnyです。"
def hiragana_pick(text)
    matched_hiraganas = text.scan(/[あ-ん]+/)
    matched_hiraganas
end

hiraganas_array = hiragana_pick(text)
p hiraganas_array

# 問題3：
# 次の文字列の中から**「http://」または「https://」で始まるURL**をすべて抜き出してください。
text = "サイトA: http://example.com と サイトB: https://sample.jp にアクセスしてください。"

def URL_pick(text)
    urls = text.scan(%r{https?://[\w./-]+})
    urls
end

p URL_pick(text)