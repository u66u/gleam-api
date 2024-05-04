import gleam/option.{type Option, None, Some}
import wisp.{type Request, type Response}

pub type Context {
  Context(key: Option(String))
}

pub fn handle_request(request: Request, context: Context) -> Response {
  wisp.ok()
}

pub fn authenticate(req: Request, ctx: Context) -> Response {
  todo
}
