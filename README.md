# FILE PROCESSING

### About
This utility is capable of parsing information from a .txt file to JSON data which is then used to make a JSON post request to the  https://recruitbot.trikeapps.com/api/v1/roles/bellroy-tech-team-recruit/big_five_profile_submissions endpoint.

### Technology used
- Ruby 3.0.0
- Bundler 2.2.11
- Rspec

### Installation
N/B To have the application run with your ruby version or bundler version, make sure to delete the Gemfile.lock file before running `bundle install`.
- Clone the app with the command
```git clone git@github.com:RoyNyaga/file-processing-interview.git``` 
- Enter the root directory (the folder which contains the Gemfile) using your terminal and install gems using the command
``` bundle install``` 

### Running the utility locally
- Enter the `lib` directory and run `ruby main.rb`

### Expectation
- You will receive a response body with the text `Email has already been taken`

### Explanition 
The endpoint to which the post request is sent has a validation for email uniqueness and since I have already sent a successful post request with my email, any other subsequent request with the same email will rails an `Email has already been taken` validation error. To pass this validation, you can edit the email in the file_processor.rb file before running `ruby main.rb` and this time around you will receive a response status of 201 and token in the response body.

### Testing
- To run the test cases, enter the root directory and run `rspec`.
