class Talk
  include Lotus::Entity
  attributes :title, :author, :link

  def embed
    return "" unless embeddable?
    "<iframe width=\"100%\" height=\"auto\" src=\"#{embeddable_link}\" frameborder=\"0\" allowfullscreen></iframe>"
  end

  private
  def embeddable_link
    @embeddable_link ||= begin
      parts = /(.+?youtube\.com\/)watch\?v=(.+?)(&|$)/.match(link)
      return nil unless parts && parts.length > 1
      "#{parts[1]}embed/#{parts[2]}"
    end
  end

  def embeddable?
    !embeddable_link.nil?
  end
end
