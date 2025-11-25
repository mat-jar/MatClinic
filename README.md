# MatClinic app

## tl;dr

- Ruby on Rails app hosted on Fly.io
- https://mat-clinic.fly.dev/
- PostgreSQL, ActiveRecord CRUDs, enum, service objects, custom validation, bootstrap, custom css, Hotwire (Turbo Frames & Stimulus), chart.js, rake task, kaminari, ransack, Rspec

## About

MatClinic is a simple app to make appointments in a clinic. It allows to book a consultation for specific patient, doctor, date and time. The app provides basic CRUD functionality for patients, doctors and appointments (showing details, listing, creating, deleting, updating). Index tables are paginated with kaminari. Patients index table can be filtered and sorted (ransack). An appointment can be made in a chosen 20-minute time slot (between 8am and 4pm).<br />

The app contains 'Statistics' page with bar chart showing number of patients born in a given year. The chart is made with Stimulus controller and Chart.js. <br />

Patients records can be imported from CSV file using rake task `rake patients:import CSV_FILE=filename.csv` Pesel numbers in the CSV file are parsed into birth date and gender.

## To do in future :)

- More charts with better stylisation
- Turbo Streams and broadcast
- Advanced search/filtering subpage
- and probably some more...
