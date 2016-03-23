module ApplicationHelper

  #Set Github defaults for the markdown to html renderer
  def markdown(text)
    markdown = Redcarpet::Markdown.new(
        Redcarpet::Render::HTML,
        no_intra_emphasis: true,
        tables: true,
        fenced_code_blocks: true,
        autolink: true,
        disable_indented_code_blocks: true,
        strikethrough: true )
    return markdown.render(text).html_safe
  end

end
