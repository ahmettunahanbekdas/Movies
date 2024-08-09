# Movies

This project is created to develop a simple movie application using the MVVM (Model-View-ViewModel) architecture. Here are the main processes we implemented in this project:

### Folder Structure
In order to organize the code and facilitate maintenance, we created the following folder structure:

- **Models:** Struct models responsible for the transformation from JSON to Struct.
- **Networking:** Generic network manager and service layer operating with the Result type.
- **Views:** Folder containing custom cells and views.
- **ViewModels:** View model classes that communicate with the view.
- **Extensions:** Folder containing numerous extension functions.

### Generic Network Manager
Within the project, we developed a general-purpose network manager. This manager stands out with the ability to handle URLSessionDataTask cancellation operations.

### Result Type
To handle results returned from network operations, we used the Result type to make the code more reliable and readable.

### Model Creation and JSON Transformation
In the project, we examined the transformation from JSON to Struct using the Codable protocol. Additionally, we established the connection between JSON keys and model properties using the CodingKey protocol.

### 100% Programmatic 
UI elements were entirely created programmatically. Custom cells and views were used for customizations.

### MVVM and Communication
Using the MVVM architecture, we facilitated communication between the view model and the view. We explained the use of weak self with examples and touched upon the topics of retain cycles.

### UICollectionView and Pagination
We utilized UICollectionView to create collections displaying data. Pagination was implemented when fetching data.

### Binding and Closure Usage
We employed the MVVM Binding concept to facilitate communication between the view and view model. We also explored the usage of closures and protocol communication.

The actions taken in this project serve as a valuable resource to understand fundamental concepts of Swift and MVVM architecture. After reviewing the project, you can find more information in the code files and documentation.

## :movie_camera: Screen Recording
https://github.com/ahmettunahanbekdas/Movies/assets/97003033/03582ed4-a774-4074-9464-00c7305a4241



 
