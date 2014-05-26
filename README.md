### Running a StatsD embedded in a Ruby app on Heroku

Inspired by a [post on combining a Python app with
StatsD](http://tartarus.org/james/diary/2013/04/18/running-statsd-on-heroku),
extended for Ruby and to export data directly to Librato.

### Setup

Clone and deploy to a Heroku app, then add the multi buildpack:

* `hk set BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git`

Add the Librato addon (minimum paid level - $19 - is required to track custom metrics):

* `hk addon-add librato:nickel`

That's it.

The StatsD configuration is pre-setup to extract the Librato credentials from
the environment.

### Details

The app uses the multi buildpack to install and run both the buildpack for Ruby
and Node.js. The latter will automatically pick up the package.json included in
the project.

To run both processes at the same time the Procfile runs foreman with another
Procfile which contains both the statsd instance and the web process.

StatsD will end up running on `localhost:8125` inside the dyno.
