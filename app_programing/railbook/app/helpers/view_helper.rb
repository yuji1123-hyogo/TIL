module ViewHelper
  def format_datetime(datetime, type = :datetime)
    return '' unless datetime

    case type
      when :datetime
        format = '%Y年%m月%d日 %H:%M:%S'
      when :date
        format = '%Y年%m月%d日'
      when :time
        format = '%H:%M:%S'
    end

    datetime.strftime(format)
  end

  def list_tag(collection, prop)
    tag.ul do
      collection.each do |el|
        concat tag.li el.attributes[prop]
      end
    end
  end

  def blockquote_tag(cite, citetext, options = {}, &block)
    options.merge! cite: cite
    quote_tag = tag.blockquote capture(&block), **options
    c_tag = tag.cite "出典：#{citetext}"
    quote_tag.concat(c_tag)
  end

  def blockquote_tag2(cite, citetext, body = '', options = {}, &block)
    options.merge! cite: cite
    quote_tag = tag.blockquote block_given? ? capture(&block) : body, **options
  end
end
