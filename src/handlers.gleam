import gleam/option.{type Option, None, Some}
import router
import wisp.{
  type Request, type Response, handle_head, log_request, method_override,
  rescue_crashes,
}

pub type Context {
  Context(key: Option(String))
}

pub fn middleware(
  req: Request,
  handle_request: fn(Request) -> Response,
) -> wisp.Response {
  let req = method_override(req)
  use <- log_request(req)
  use <- rescue_crashes
  use req <- handle_head(req)

  handle_request(req)
}

pub fn handle_request(req: Request) -> Response {
  use req <- middleware(req)

  case wisp.path_segments(req) {
    [] -> router.home(req)
    _ -> wisp.not_found()
  }
}

pub fn authenticate(req: Request, ctx: Context) -> Response {
  todo
}
