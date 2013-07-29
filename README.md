# Startup of Puerto Rico

Ruby On Rails project for [CAP-003](https://github.com/SoPR/CAP/pull/3)

## Index

* [Installation](#installation)
* [Configuration](#configuration)
  - [SMTP](#smtp)
  - [Sample SMTP Configuration using GMail](#sample-smtp-configuration-using-gmail)
  - [Cookies](#cookies)
  - [CDN Asset Host](#cdn-asset-host)
  - [How to set environment keys](#how-to-set-environment-keys)
* [Requirements](#requirements)
* [Authors](#authors)
* [Contributing](#contributing)
* [License](#license)

Installation
---------------------

If you don't already have Rails 4.0 run:

    $ gem install rails --version 4.0.0 --no-ri --no-rdoc

To install every dependency:

    $ bin/bundle install

Database creation (Development Environment):

    $ bin/rake db:migration

To run the project:

    $ bin/rails server

Now open your browser and head to:

    http://localhost:3000
    
## Configuration
    
### Environment Keys
#### SMTP (Production Environment)
For the email notifications to work in Production, you need to have the following defined:
    
    SMTP_SERVER
    SMTP_SERVER_PORT
	EMAIL_DOMAIN_NAME
    AUTH_TYPE
    SMTP_USERNAME
	SMTP_PASSWORD
	TLS_AUTO
	
##### Sample SMTP Configuration using GMail

 	SMTP_SERVER="smtp.gmail.com"
    SMTP_SERVER_PORT="587"
	EMAIL_DOMAIN_NAME="gmail.com"
    AUTH_TYPE="plain"
    SMTP_USERNAME="your_email@gmail.com"
	SMTP_PASSWORD="your_password_here"
	TLS_AUTO="true"

**Note**: In *Development* mode, the [letter_opener](https://github.com/ryanb/letter_opener) is used to avoid the SMTP configuration. It will open any email (sent from the App) in the browser instead of actually sending it.
	
#### Cookies
	
For deploying the project it is recommended that you provide your own secret_key.

First, generate a new key by running:

	$ rake secret
	
Second, add the new key to:

	SECRET_TOKEN
	

#### CDN Asset Host
	
To provide your own custom CDN Asset Host using Amazon Simple Storage Service ([S3](http://aws.amazon.com/s3/)) :


	AWS_ACCESS_KEY_ID
	AWS_SECRET_ACCESS_KEY
	FOG_DIRECTORY
	FOG_PROVIDER

**Note**: *This is used for image Uploads through the [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) gem*


### How to set environment keys

In a **local** system:

	$ export SECRET_KEY="f4d3b672dc24ce84f1946c25d275b3c2f1ad8476622f…"
	
**Note**: You could also save it in your ~/.bash_profile

Using **Heroku**:

	$ heroku config:set SECRET_KEY=f4d3b672dc24ce84f1946c25d275b3c2f1ad847662f


## Requirements

  * [RVM](https://rvm.io/rvm/install)
  * Ruby version: ~> v2.0.0
  * Rails: v4.0.0
  * Database: 
  	* **Development**: sqlite3 (v.3.7.12+)
  	* **Production**: PostgreSQL
  * [RMagick](https://github.com/rmagick/rmagick)
  
## Authors
* [José Padilla](https://www.github.com/jpadilla)
* [Ryan Oliver](https://www.github.com/r23712)
* [Jonah Ruiz](https://www.github.com/jonahoffline)
* [Axel Rivera](https://www.github.com/riveralabs)
  
  
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License
The MIT License (MIT)

Copyright (c) 2013 José Padilla

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  