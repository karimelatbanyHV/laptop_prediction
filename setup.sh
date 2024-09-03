# Load the machine learning model
model = joblib.load('model.pkl')

# Create a Flask application
app = Flask(__name__)

# Define a route for the API endpoint
@app.route('/predict', methods=['POST'])
def predict():
    # Get the input data from the request
    input_data = request.get_json()

    # Make a prediction using the machine learning model
    prediction = model.predict(input_data)

    # Return the prediction as a JSON response
    return jsonify({'prediction': prediction.tolist()})

# Start the Flask application
if __name__ == '__main__':
    app.run()