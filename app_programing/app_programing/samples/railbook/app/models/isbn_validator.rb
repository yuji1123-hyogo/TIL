class IsbnValidator < ActiveModel::EachValidator

  #パラメーターを持たない検証クラス
  # def validate_each(record, attribute, value)
  #   record.errors.add(attribute, 'は正しい形式ではありません。') \
  #     unless /\A978-4-[0-9]{2,5}-[0-9]{2,5}-[0-9X]\z/ === value &&
  #       value.length == 17
  # end

  # パラメーターを受け取る検証クラス
  def validate_each(record, attribute, value)
    if options[:allow_old]
      pattern = /\A4-[0-9]{2,5}-[0-9]{2,5}-[0-9X]\z/
      len = 13
    else
      pattern = /\A978-4-[0-9]{2,5}-[0-9]{2,5}-[0-9X]\z/
      len = 17
    end
    record.errors.add(attribute, 'は正しい形式ではありません。') unless pattern === value && value.length == len
  end

end
