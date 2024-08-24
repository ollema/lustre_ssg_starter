// IMPORTS ---------------------------------------------------------------------

import gleam/result
import lustre/attribute.{attribute}
import lustre/element.{type Element}
import lustre/element/html.{html}
import lustre/ssg
import lustre/ssg/djot
import simplifile

// MAIN ------------------------------------------------------------------------

pub fn main() {
  ssg.new("./dist")
  |> ssg.add_static_route("/", page(render("./src/content/index.dj"), "Home"))
  |> ssg.add_static_dir("./static")
  |> ssg.use_index_routes
  |> ssg.build
}

fn page(content: List(Element(Nil)), title: String) -> Element(Nil) {
  html([attribute("lang", "en"), attribute.class("overflow-x-hidden")], [
    html.head([], [
      html.title([], title),
      html.meta([attribute("charset", "utf-8")]),
      html.meta([
        attribute("name", "viewport"),
        attribute("content", "width=device-width, initial-scale=1"),
      ]),
      html.link([attribute.href("/pico.min.css"), attribute.rel("stylesheet")]),
      html.style(
        [],
        " body > div {
                max-width: 60ch;
                margin: 0 auto;
                padding-top: 2rem;
              }
            ",
      ),
    ]),
    html.body([], [html.div([], content)]),
  ])
}

pub fn render(from file: String) -> List(Element(Nil)) {
  let content =
    simplifile.read(file)
    |> result.map(djot.render(_, djot.default_renderer()))

  case content {
    Ok(content) -> content
    Error(error) -> {
      let error_message =
        "could not parse file: "
        <> file
        <> " - "
        <> simplifile.describe_error(error)
      panic as error_message
    }
  }
}
