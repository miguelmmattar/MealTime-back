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

## Features

### POST /sign-up

requires: body

  - body example: 
  
   ```
   {
      "name": "Jon",
      "email": "jon@gmail.com",
      "password": "@123456Ab",
      "confirmPassword": "@123456Ab"
   }
   ```
status: 
  ```
   200 - OK
   500 - SERVER_ERROR
   409 - CONFLICT ##E-mail already registered
   422 - UNPROCESSABLE_ENTITY ##Incorrect entry
  ```

##

### POST /sign-in

requires: body

  - body example: 
  
   ```
   {
      "email": "jon@gmail.com",
      "password": "@123456Ab"
   }
   ```
returns: session  

  - return example:

   ```
   {
      "userId": 1,
      "token": "AbCdEf123456""
   }
   ```

status: 
  ```
   200 - OK
   500 - SERVER_ERROR
   401 - UNOUTHORIZED ##Incorrect credentials
   422 - UNPROCESSABLE_ENTITY ##Incorrect entry
  ```

## 

### PUT /sign-out

requires: header

  - header example: 
  
   ```
   {
      "Authorization": "Bearer AbCdEf123456"
   }
   ```
status: 
  ```
   200 - OK
   500 - SERVER_ERROR
   401 - UNOUTHORIZED ##Incorrect credentials
  ```

##

### GET /categories

requires: header

  - header example: 
  
   ```
   {
      "Authorization": "Bearer AbCdEf123456"
   }
   ```
returns: categories

- return example:

   ```
  [
     {
       "id": 1,
       "name": "pasta"
     },
     {
       "id": 2,
       "name": "chicken"
     },
     {
       "id": 3,
       "name": "meat"
     }
  ]
   ```

status: 
  ```
   200 - OK
   500 - SERVER_ERROR
   401 - UNOUTHORIZED ##Incorrect credentials
  ```

## 

### GET /recipes

requires: header

  - header example: 
  
   ```
   {
      "Authorization": "Bearer AbCdEf123456"
   }
   ```
allowes: query (categoryId / search)

  - query examples: 
  
   ```
   ?categoryId=1?
   ?Search=fish
   ?categoryId=1?Search=cheese
   ```
   
returns: recipes array

- return example:

  ```
  [
     {recipe 1},
     {recipe 2},
     {recipe 3}
  ]
 
  ```
 
status: 

  ```
   200 - OK
   500 - SERVER_ERROR
   401 - UNOUTHORIZED ##Incorrect credentials
  ```

## 

### POST /recipes

requires: header

  - header example: 
  
   ```
   {
      "Authorization": "Bearer AbCdEf123456"
   }
   ```
returns: recipe

- return example:

   ```
  {
    "id": 6,
    "name": "Cup Noodles",
    "serves": 1,
    "prepTime": 5,
    "method": "STEP 1\nBoil water.\n\nSTEP 2\nOpen the lid, without removing it completely.\n\nSTEP 3\nAdd the boiled water.\n\nSTEP 4\nClose the lid and wait 3 minuts.",
    "image": "[https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-1001491_11-2e0fa5c.jpg?quality=90&webp=true&resize=300,272](http://cdn.firstwefeast.com/assets/2015/03/cupnoodles.jpg)",
    "category": [
      {
        "id": 1,
        "name": "pasta"
      },
      {
        "id": 9,
        "name": "soup"
      }
    ],
    "ingredients": [
      {
        "name": "water",
        "quantity": "250mL"
      },
      {
        "name": "Cup Noodles",
        "quantity": "1 unity"
      }
    ],
    "by": {
      "id": 3,
      "name": "Mary"
    }
  }

   ```
   
status: 
  ```
   200 - OK
   500 - SERVER_ERROR
   401 - UNOUTHORIZED ##Incorrect credentials
   422 - UNPROCESSABLE_ENTITY ##Incorrect entry
  ```

## 

### DELETE /recipes/:recipeId

requires: header, params

  - header example: 
  
   ```
   {
      "Authorization": "Bearer AbCdEf123456"
   }
   ```
   
   - params example: 
  
   ```
   /33
   ```
   
status: 
  ```
   200 - OK
   500 - SERVER_ERROR
   401 - UNOUTHORIZED ##Incorrect credentials
  ```
