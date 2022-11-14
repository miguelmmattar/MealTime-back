# MealTime-back

Back-end for MealTime, a recipe sharing app.

## About

MealTime is a web browser application on wich you can share your own recipes or find some from the commuitity.

## How to run (locally)

1. Clone this repository
2. Install all dependencies

```bash
npm i
```

3. Create a PostgreSQL database with whatever name you want
4. On terminal, execute:

```bash
sudo -i -u postgres
```
 
 5. Go to MealTime root directory
 6. Execute:

```bash
psql db_name < dump.sql
```
7. Configure the `.env` file following the `.env.example` file pattern
8. Open the terminal on MealTime root directory and run the `start` script 

```bash
npm start
```
Now your application is ready to be run locally!

## Alternative (deploy)

You can find a deploy of this app on Heroku (valid until 11/28/2022) at https://mealtime-postgres.herokuapp.com/

#### Attached data base URI: 
postgres://vpusihwbpvbaxr:5dc7bf324841db6e2cc427c9aae43870284bba0336b728a5b588b8f78e107eda@ec2-3-229-11-55.compute-1.amazonaws.com:5432/dv5uf3rer02rd
