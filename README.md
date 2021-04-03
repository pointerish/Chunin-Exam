![](https://img.shields.io/badge/RoR-red)
![](https://img.shields.io/badge/Redis-red)
![](https://img.shields.io/badge/Postgres-blue)
![](https://img.shields.io/badge/Howtire-yellow)
![](https://img.shields.io/badge/StimulusJS-orange)
![](https://img.shields.io/badge/Tailwind-CSS-yellow)
![](https://img.shields.io/badge/Docker-black)

# Chunin | A URL Shortener

## Features

- It shortens a URL, obviously. :smile:
- Uses ActiveAdmin where an admin can track analytics.

## Built With

- Ruby v2.7.2
- Ruby on Rails v6.1.3
- PostgreSQL:latest (Docker)
- Redis:latest (Docker)
- Tailwind CSS

## Getting Started

### Prerequisites

- Postgres
- Redis
- NodeJS
- NPM

If you want to use the `docker-compose` file you need to install Docker and Compose first. This facilitates the setup for Postgres and Redis.

If you're not going to use Docker you will need to install and configure Postgres and Redis manually on your local machine.

To get the application up and running follow the next steps:

- Run `docker-compose up -d` if using Docker/Compose.
- Get the repository by either cloning or Zip download
- Install gems with `bundle install`
- Run `bin/rails webpacker:install`
- Setup database with `bin/rails db:migrate`
- Run `bin/rails db:seed` in order to setup the Admin user.

### Tests

Run the following to run the tests:

```
rspec
```

### Design Choices

#### How to shorten the URL

I chose a form of hashing in order to generate a unique key for the URL. For this, at first I thought to use a builtin hashing method and take a substring out of it to make it short. This, of course, it's not a great approach as it increases the possibility of collisions when a lot of URLs are shortened. After some research I found a wonderful `gem` called `hashid` which takes care of this in an efficient manner.

#### How to make sure the URL is actually valid

In the form is pretty easy to discriminate between an URL and another random piece of text as Rails provides FormHelpers to do so. At model level I am using a gem called `validate_url` that makes sure the URL is valid.

#### How to generate a new URL

I am using the original URL's hashid to query the database and then redirect to the original URL using Rails' `redirect_to` method.

#### Database structure

I created two tables: `links` and `requests`. The table `links` contains all URLs submitted via the form, and a column `click_count` that stores how many time that URL has been clicked.

The table `requests` has two columns: `device` and `ip`. Those store each link's device information and IP. The relationship between these two tables is One-To-Many. A link can have many requests.

#### UI

The UI is very simple. I decided to use Tailwind simply because I like it more than Bootstrap. I also added some custom CSS to animate the clipboard icon. As for Stimulus, I only have one class with one method, which was written to allow the user to copy the shortened URL into the clipboard by just clicking on the clipboard icon.

I am using a Hotwire Turbo Frame to display the newly generated URL when the User submits it via the form in order to avoid page reloading.


## Author

👤 **Josias Alvarado**

- GitHub: [@pointerish](https://github.com/pointerish)
- Twitter: [@pointerish](https://twitter.com/pointerish)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/josias-alvarado/)

## Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/pointerish/Chunnin-Exam/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- HJ
- The Rails and Ruby community