{
  backends: ["statsd-librato-backend"],
  librato: {
    email:  process.env("LIBRATO_USER"),
    token:  process.env("LIBRATO_TOKEN"),
    source: 'statsd-sinatra-' + process.env("DYNO")
  }
}
