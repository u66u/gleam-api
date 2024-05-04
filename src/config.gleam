import gleam/int
import gleam/option.{type Option, None, Some, from_result}
import gleam/pgo
import gleam/result
import glenvy/dotenv
import glenvy/env
import utils

pub fn db() {
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
}
// let db = pgo.connect(postgres_config)
// let q = first.first_downgrade_sql
// let response = pgo.execute(q, db,[], dynamic.string)
