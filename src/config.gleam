import gleam/int
import gleam/option.{type Option, None, Some, from_result}
import gleam/pgo
import glenvy/dotenv
import glenvy/env
import utils
import wisp.{log_info}

pub fn connect_to_db() -> pgo.Connection {
  let _ = dotenv.load()
  let host = utils.check_env("PGHOST")
  let assert Ok(port) = int.parse(utils.check_env("PGPORT"))
  let database = utils.check_env("PGDATABASE")
  let user = utils.check_env("PGUSER")
  let password = from_result(env.get_string("PGPASSWORD"))
  let assert Ok(pool_size) = int.parse(utils.check_env("PGPOOLSIZE"))

  let postgres_config =
    pgo.Config(
      ..pgo.default_config(),
      host: host,
      port: port,
      database: database,
      user: user,
      password: password,
      pool_size: pool_size,
    )
  let assert connection = pgo.connect(postgres_config)
  log_info("Connection to postgres established successfully")
  connection
}