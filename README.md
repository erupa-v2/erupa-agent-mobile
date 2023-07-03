# erupa agent

Hire experts to assist you :zap:

This application uses clean architecture developed by Robert C. Martin.
***

## Application Structure

<img src="https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?w=556&ssl=1" alt="clean-architecture-diagram-1.png" width="700">

## Naming Convention

* Naming of usecases should be based upon CRUD thus a usecase that would create a user account should be
  named `CreateUser`. Usecase files should be named `create.dart` not `create_user.dart`
* Avoid repetitive words in defining repository contracts. do `create(String name)`
  not `createUser(String name)`

##### Folder Structure

* In the lib folder, there are two folders, `core`,`src` and `shared`.
    - The `core` folder contains essential features of the app. Without them the application can't
      function an example is the `user`, the application can't handle any resource protected action.
    - The `src` folder contains add up features or functionalities that are added up to the
      application to enhance the UX. An example is adding `notification`, the application doesn't
      require is to function but it makes alerting the users easier.
    - The `shared` folder contains add up features or functionalities that are shared across the entire app.
* In every feature folder either in `core`, `shared` or `src`, it follows a folder structure which is based
  upon clean architecture. The two folders are `data`,`domain` and `presentation`

##### Domain: Entities

* Represent your domain object
* Apply only logic that is applicable in general to the whole entity (e.g. User object)
* Plain dart objects: no frameworks, no annotations

##### Domain: Repositories

* Represent your abstract contracts for the functionalities to be represented.
* Should contain only abstract class with pure dart code that is well documented for reference.

##### Domain: Use Cases

* Represent your business actions, it’s what you can do with the application. Expect one use case
  for each business action
* Pure business logic, plain dart.
* The use case doesn't know who triggered it and how the results are going to be presented (e.g.
  returns an entity or a failure, log out, or simply logged, etc.)

##### Data: Repositories

* This implements the abstract contract written in the `domain/repositories` folder.
* Favour composition over inheritance. either the local database,network info or remote database
  would be called. In some cases, Other platform dependent abstract repositories would be called.
* Define interfaces for the data that they need in order to apply some logic. One or more databases
  will implement the interface, but the use case does’t know where the data is coming from
* Throws business exceptions

##### Data: Models

* Extends domain entities to add json conversion and database related input and outputs.
* Plain dart objects: comes with annotations

##### Data: Database

* Retrieve and store data from and to a number of sources either remote database or locally
* Implement the interfaces defined by the use case
* Use whatever framework is most appropriate (they are going to be isolated here anyway). This
  project uses `hive`.
* Note: if using an ORM for database access, here you'd have another set of objects in order to
  represent the mapping to the tables (don't use the core entities as they might be very different).
  This project has `hive_adapters` that are used as the database ORM.

##### Presentation: Bloc

* Connects usecases to the UI flow.
* Handles simple data manipulation to suit the pages.
* Can contain core flutter engine codes but no widget related import.

##### Presentation: Page

* Contains specific UI code, flutter material/cupertino related imports.
* Can be a standalone screen without any extension from ancestor screens.

##### Presentation: Widget

* Contains specific UI code, flutter material/cupertino related imports.
* Can not be standalone screen and needs to be imported into an existing page.
* Use widgets to break down, long code lines into simple modular pages.

##### Shared:Platform

* Are ways to interact with the application, and typically involve a delivery mechanism (e.g.
  android or ios plugins)
* This handles plugin configurations from third party services.

##### Shared:data

* Wires everything together
* Has the "dirty details" like api keys and assets.

***

## Resources

##### Presentation

* Real Life Clean
  Architecture http://www.slideshare.net/mattiabattiston/real-life-clean-architecture-61242830

##### Blogs & Articles

* The Clean Architecture https://blog.8thlight.com/uncle-bob/2012/08/13/the-clean-architecture.html
* https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/

##### Videos & Presentations

* Clean Coders ep. 7: Architecture, Use Cases, and High Level
  Design https://cleancoders.com/episode/clean-code-episode-7/show
* Robert C. Martin - Clean Architecture and Design https://www.youtube.com/watch?v=Nsjsiz2A9mg

***
