import gleam/http.{Get}
import gleam/string_builder
import wisp.{type Request, type Response}

pub fn home(req: Request) -> Response {
  use <- wisp.require_method(req, Get)

  let html = string_builder.from_string("Hello, world!")
  wisp.ok()
  |> wisp.html_body(html)
}

pub fn dataset(req: Request, id: String) -> Response {
  use <- wisp.require_method(req, Get)

  let html = string_builder.from_string("Here we need to getch a GEO dataset with id " <> id)
  wisp.ok()
  |> wisp.html_body(html)
}