require 'kconv'

result = "#{@books.attribute_names.join(',')}\r"
@books.each do |b|
  result << "#{b.attributes.values.join(',')}\r"
end
result.kconv(Kconv::SJIS, Kconv::UTF8)
