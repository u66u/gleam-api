import gleam/http.{Get, Post}
import gleam/string_builder
import wisp.{type Request, type Response}

pub fn home(req: Request) -> Response {
  use <- wisp.require_method(req, Get)

  let html = string_builder.from_string("Hello, Joe!")
  wisp.ok()
  |> wisp.html_body(html)
}
