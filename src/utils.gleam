import gleam/string
import glenvy/dotenv
import glenvy/env

pub fn check_env(name: String) -> String {
  case env.get_string(name) {
    Ok(var) -> var
    Error(_) -> panic as string.append("ENV variable is not set: ", name)
  }
}
