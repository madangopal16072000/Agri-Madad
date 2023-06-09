
# Agri Madad

Agri Madad is an agriculture app that aims to assist farmers in addressing irrigation issues. To predict the minimum water depth in centimeters required for crop survival, the app employs a random forest algorithm that uses real-time field data such as humidity, temperature, and soil moisture gathered from a node MCU. The app provides an authentication system and displays weather forecasts, as well as the current task that the user needs to complete, such as the required amount of water at a particular time. Additionally, the app features a one-click field irrigation function that automatically turns off the motor after an adequate amount of water has been delivered. Flutter was utilized for app development and GetX for app management. Firebase was used for data management through both Firestore and real-time Firebase. Flask was used to build the machine learning model API, which was deployed on Azure.
## Features

- Authentication
- Current Task
- Animated Interactive UI
- Water Reqirement Prediction


## Screenshots
<p float="left">
<img src="https://user-images.githubusercontent.com/115138974/235730286-71b6ac4a-04d3-4f20-9110-170d20eafaf3.jpg" height ="400" width ="200">
<img src="https://user-images.githubusercontent.com/115138974/235730351-1b4802f0-3a64-42d3-af84-e5704faebe23.jpg" height ="400" width ="200">
<img src="https://user-images.githubusercontent.com/115138974/235730390-97bd641e-6eff-4bdd-84c9-53df3d587338.jpg" height ="400" width ="200">
<img src="https://user-images.githubusercontent.com/115138974/235730425-4c3d297d-52f1-4eb8-90d9-c15cd1fb8bd8.jpg" height ="400" width ="200">
<img src="https://user-images.githubusercontent.com/115138974/235730504-98c5cf87-dc36-4de2-8ec5-b525e188fc0b.jpg" height ="400" width ="200">
<img src="https://user-images.githubusercontent.com/115138974/235730535-02db0d66-0814-41ca-a524-57e1ae076965.jpg" height ="400" width ="200">
<img src="https://user-images.githubusercontent.com/115138974/235730599-5fa92f33-c967-49ca-a7b1-9be7830347ab.jpg" height ="400" width ="200">

 </p>

## Demo


field demo



https://user-images.githubusercontent.com/115138974/235748955-e2630821-8ca4-44ac-b079-eaa18b63a7ec.mp4





App demo


https://user-images.githubusercontent.com/115138974/235750956-3fb9ed76-3f28-4012-9264-01936e3d268b.mp4










## API Reference

#### Machine learning Model API for predicting water requirement
https://mlcropirrigation.azurewebsites.net/
## Machine Learning Model Code
https://github.com/Kaps61929/Agri-Madad-ML-Model-Code
                          
## Tech Stack

**Client:** Flutter,Getx

**Server:** Firebase,Azure,Flask

**Algorithm** Random Forest

