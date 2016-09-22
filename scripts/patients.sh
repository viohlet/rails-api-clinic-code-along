#index

#show

#create
curl --include --request POST http://localhost:3000/patients \
  --header "Content-Type: application/json" \
  --data '{
    "patient": {
      "name": "Will",
      "sickness": "Runs too fast"
    }
  }'

#update
curl --include --request PATCH http://localhost:3000/patients/5 \
  --header "Content-Type: application/json" \
  --data '{
    "patient": {
      "name": "Will McBride",
      "sickness": "Runs too fast"
    }
  }'

#destroy
curl --include --request DELETE http://localhost:3000/patients/4 \
  --header "Content-Type: application/json"
