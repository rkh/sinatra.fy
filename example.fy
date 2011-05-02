require: "sinatra"

configure: { enable: 'sessions }
configure: 'production with: { disable: 'show_errors }
configure: ['production, 'development] with: {
  enable: 'logging
}

before: { "request coming in" println }
get: "/" do: { "This is Fancy!" }

not_found: { "Fancy doesn't know this ditty!" }
