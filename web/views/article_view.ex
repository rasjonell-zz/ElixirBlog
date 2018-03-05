defmodule Blog.ArticleView do
  use Blog.Web, :view
  use Timex

  def list_date_format(date, format_string \\ "%B %d, %Y") do
    if date do
     << Ecto.Date.to_iso8601(date) <> "T00:00:00Z" >>
      |> Timex.parse!("{ISO:Extended}")
      |> Timex.format!(format_string, :strftime)
    else 
      "Not Specified"
    end
  end
end
