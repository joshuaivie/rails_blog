![](https://img.shields.io/badge/Microverse-blueviolet)

# Rails Blog

> A simple blog exploring key concepts in Ruby on Rails such as MVC framework, CRUD operations, Form Builder, Active Record, Active Record association etc.

## Built With

- Ruby >= 3.0.0
- Ruby on Rails >= 6.1.3.1
- Rails Active Storage

## Live Demo

[Blog App](https://rails-template-blog.herokuapp.com/)

## Getting Started

### Prerequisites

- A github account
- Ruby and Ruby on Rails installed on your computer
- A terminal with your github account logged in

### Setup

- Use your github account and your terminal to clone this repository to your computer:

`git clone https://github.com/joshuaivie/mv-rb_Blog`

- Go to the cloned directory:
  `cd mv-rb_Blog`

- Run `yarn install` to install the project dependencies

- Run `rails db:create` to create the database

- Run `rails db:migrate` to create the tables

- Run `rails s` and go to `http://127.0.0.1:3000`.

### Troubleshooting

#### Error "Webpacker::Manifest::MissingEntryError" on starting application

- stop the web app
- run `bundle exec rake webpacker:install`
- run `rails s`

## Author

👤 **Joshua Ivie**

- GitHub: [@joshuaivie](https://github.com/joshuaivie)
- Twitter: [@joshuaivie\_](https://twitter.com/joshuaivie_)
- LinkedIn: [joshuaivie](https://linkedin.com/in/joshuaivie)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.
