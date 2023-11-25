# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: Ruby-3.1.3
* Rails version: Rails-7.0.4.2

* System dependencies
  - to install nysql
    - update system
      ```
      sudo apt update
      ```
    - install mysql
      ```
      sudo apt install mysql-server
      ```
    - install lib for building native extension
      ```
      sudo apt install libmysqlclient-dev
      ```
  - to install nodejs
    - install node version manager
      ```
      curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
      ```
    - install node version
      ```
      nvm install <node_version>
      ```

* Configuration
  - to configure mysql
    - create user
      ```
      CREATE USER '<username>'@'<host>' IDENTIFIED BY '<password>';
      ```
    - grant privileges
      ```
      GRANT CREATE, DROP, ALTER, SELECT, INSERT, UPDATE, DELETE, INDEX, REFERENCES ON *.* TO '<username>'@'<host>';
      ```
  - to config webpacker/stimulus
    ```
    rake webpacker:install
    ```

* Database creation
  ```
  rake db:create
  ```

* Database initialization
  ```
  rake  db:migrate
  rake db:seed
  ```

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
