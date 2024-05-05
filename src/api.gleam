import gleam/erlang/process
import handlers.{handle_request}
import mist
import config
import wisp
import migrations/first
import gleam/pgo
import gleam/dynamic
import gleam/io

pub fn main() {
  wisp.configure_logger()

  let secret_key_base = wisp.random_string(64)

  let assert Ok(_) =
    wisp.mist_handler(handle_request, secret_key_base)
    |> mist.new
    |> mist.port(8000)
    |> mist.start_http

  process.sleep_forever()
}
