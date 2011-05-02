require(File expand_path("../sinatra/delegator", __FILE__))
require("sinatra")

Sinatra Base metaclass class_eval() {
  alias_method('enable:, 'enable)
  alias_method('configure:, 'configure)
  alias_method('configure:with:, 'configure)
}

Sinatra Delegator delegate('enable:, 'configure:, 'configure:with:)
Sinatra Application enable: 'run
