# rapid

A new Flutter project.

Participating in a recruitment task
To take part in the recruitment task, you must fork this repository, complete the tasks and push your changes.

The tasks are to be performed within an application in which we display a list of products downloaded from an external source.

The tasks will check the correctness of the solution, error resistance, code quality, readability, creativity and simplicity.

You can use external packages if you consider it necessary.

This application is not connected to the backend, but keep performance and optimization issues in mind.

Task 1.
There is a bug in the application, each time the Widgets are reloaded the tag color changes, this should be fixed so that the tag always has its initial color.

Task 2.
As part of application development, we want HomePage to open and scroll to a specific product based on the given product id.

You need to add an optional parameter to the HomePage screen that will search for the product. If the product is not on the first page, you should immediately download the next one and so on.

If a product is found, the application should scroll to that product.

Task 3
Implement a simple screen with filters for the product list; after applying the filters, the application should display only those products that meet the given filters.

This task is open-ended and requires creativity. We want to check your approach to designing solutions. What filters you add is up to you.

Let the UI be simple, that is not the purpose of this task.

The filtered products should be broadcast by HomeCubit.

Example filters:

Tag filter
Filter only your favorite products
Price range filters
Task 4
Create unit tests for HomeCubit.

Running project
This project uses Flutter in version 3.19.0

Project uses build_runner, to generate code use command flutter pub run build_runner build --delete-conflicting-outputs
