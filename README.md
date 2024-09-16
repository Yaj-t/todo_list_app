# To-Do List App

A simple Flutter application for managing tasks. This app allows users to add, delete, and toggle tasks between completed and incomplete statuses. Tasks can be organized into unfinished and completed categories.

## Demo and Screenshots

Check out the demo video and screenshots of the app:

- **[View Demo Video and Screenshots]([https://drive.google.com/drive/folders/your_folder_id?usp=sharing](https://drive.google.com/drive/folders/1B1MGzZ1Gxx9heEg2FvJfXHhmBVrZt8uD?usp=sharing))**

## Features

- **Add Tasks**: Add new tasks to your to-do list.
- **Toggle Tasks**: Mark tasks as completed or incomplete.
- **Delete Tasks**: Remove tasks from the list.
- **Mass Toggle**: Toggle all unfinished tasks to completed or all completed tasks to incomplete.
- **Organized View**: Display unfinished and completed tasks in separate sections.

## Installation

To run this app, you need to have Flutter installed. Follow these steps:

1. **Clone the Repository**

    ```sh
    git clone https://github.com/yourusername/todo_list_app.git
    ```

2. **Navigate to the Project Directory**

    ```sh
    cd todo_list_app
    ```

3. **Install Dependencies**

    ```sh
    flutter pub get
    ```

4. **Run the App**

    ```sh
    flutter run
    ```

## Usage

- **Add a Task**: Enter the task description in the input field and press the "Add" button. The task will be added to the list of unfinished tasks.
- **Toggle Task Completion**: Click the checkbox next to a task to mark it as completed or incomplete.
- **Delete a Task**: Click the delete icon next to a task to remove it from the list.
- **Mass Toggle Tasks**:
  - **Unfinished Tasks**: Click the "Toggle All Unfinished" button to mark all unfinished tasks as completed.
  - **Finished Tasks**: Click the "Toggle All Finished" button to mark all completed tasks as incomplete.

## File Structure

- `lib/`
  - `models/`
    - `task.dart`: Defines the `Task` model.
  - `widgets/`
    - `task_tile.dart`: Defines the widget for displaying individual tasks.
    - `task_list.dart`: Defines the widget for displaying a list of tasks.
    - `add_task_field.dart`: Defines the widget for adding new tasks.
  - `main.dart`: Entry point of the application.
  - `screens/`
    - `todo_home.dart`: Main screen displaying tasks and input field.

## Contributing

If you want to contribute to this project, please fork the repository and create a pull request with your changes.

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Create a new pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Flutter: The framework used for building the app.

