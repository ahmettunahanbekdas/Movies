# Movies App

The **Movies App** is a simple yet effective movie application designed using the **MVVM (Model-View-ViewModel)** architecture. This project showcases key principles of Swift development, including network management, programmatic UI, and effective communication patterns.

---

## Features and Implementation

### Folder Structure
To ensure maintainability and better organization, the following folder structure was implemented:
- **Models**: Contains struct models responsible for transforming JSON data into Swift structs.
- **Networking**: Includes a generic network manager and service layer, utilizing the `Result` type for better error handling and response management.
- **Views**: Houses custom cells and reusable views.
- **ViewModels**: Contains view model classes that facilitate communication between the view and other layers.
- **Extensions**: Includes reusable extension functions for enhanced functionality.

---

### Key Components

#### Generic Network Manager
- Developed a general-purpose network manager capable of handling API requests.
- Supports **URLSessionDataTask cancellation**, ensuring robust and efficient networking.

#### Result Type
- Utilized Swift's **Result** type to handle success and failure cases in network operations.
- Improves code reliability and readability by managing errors effectively.

#### JSON Transformation
- Leveraged the **Codable** protocol for transforming JSON data into Swift structs.
- Used the **CodingKey** protocol for mapping JSON keys to struct properties.

#### 100% Programmatic UI
- All UI elements were created programmatically.
- Customized views and cells were implemented for a dynamic and reusable user interface.

#### MVVM Architecture
- Employed the MVVM pattern to separate concerns and improve testability.
- Ensured communication between the **ViewModel** and the **View** using binding and closures.
- Addressed potential retain cycles with proper usage of `weak self`.

#### UICollectionView and Pagination
- Used **UICollectionView** to create visually appealing collections for displaying movie data.
- Implemented **pagination** to fetch data in a seamless and efficient manner.

#### Binding and Closure Usage
- Adopted **MVVM Binding** to link the view with the view model dynamically.
- Demonstrated the use of closures and protocol-based communication for flexible and modular design.

---

## Technologies Used

- **Swift**: Programming language.
- **MVVM Architecture**: Ensures separation of concerns and better maintainability.
- **URLSession**: For network requests.
- **UICollectionView**: For creating dynamic and scrollable layouts.
- **Result Type**: For error handling and result management.
- **Codable Protocol**: For JSON parsing and model creation.

---

## :movie_camera: Screen Recording
https://github.com/ahmettunahanbekdas/Movies/assets/97003033/03582ed4-a774-4074-9464-00c7305a4241



 
