# Docushin

Docushin creates documentation based on your rails application routes. 

## Installation

Add this line to your application's Gemfile:

    gem 'docushin'

And then execute:

    $ bundle install

## Usage

Mount engine in your application `config/routes.rb`

    mount Docushin::Engine, :at => "docushin"

You can specify, the name of the route you want Docushin to be mountet at, just change "docushin"
to your desired destination. It creates a resource on "yousitename/docushin/routes".

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
