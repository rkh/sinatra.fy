require(File expand_path("../sinatra/delegator", __FILE__))
require("sinatra")


class Sinatra Base {
  def self def: name with: block {
    metaclass ruby: 'define_method args: [name] with_block: block
    Sinatra Delegator delegate(name)
  }

  def self configure: env with: block {
    args = [env] flatten()
    ruby: 'configure args: env with_block: block
  }

  def self configure: block {
    ruby: 'configure with_block: block
  }

  def self wrap: method {
    def: "#{method}:"    with: |b   | { ruby: method           with_block: b }
    def: "#{method}:do:" with: |a, b| { ruby: method args: [a] with_block: b }
  }

  def self wrapAll: methods {
    methods each: |m| { wrap: m }
  }

  wrapAll: [
    'get, 'put, 'post, 'delete, 'head, 'patch, 'before, 'after, 'helpers,
    'not_found, 'template, 'layout
  ]

  def self enable:  options { ruby: 'enable  args: [options] flatten() }
  def self disable: options { ruby: 'disable args: [options] flatten() }
  def self set: option to: value { set(option, value ) }

  Sinatra Delegator delegate('enable:, 'disable:, 'set:to:, 'configure:,
    'configure:with:)
}

enable: 'run
