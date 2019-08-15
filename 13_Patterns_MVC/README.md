#  13. Architecture Patterns Model View Controller (MVC)

## Overview

Model View Controller (MVC) is Apple's recommended app architecture. This very simple application will describe what this architecture is and how each object interacts with each other.

## MVC
Typically in an MVC project, the model contains and describes all the data within the project. The controller acts as a bridge between the view and the model, any information inputted by the user will be passed on to the model which is handled by the controller. The model and the view never communicate directly.

## Description

This sample task list project doesn't use nibs or storyboards to construct the views or view controller. This is a purely programmatic approach (including the layout). Notice the storyboard does not contain any additional objects view or otherwise to show the UITableView.

## Structure

ViewController
    TableView
    TableView Datasource

Model
    Task

View
    TaskCell


### ViewController
The Viewcontroller houses the datasource and also initialises the data for the table. Typically, the data would be sourced externally but in this case we'll create sample data in the loadData() function and use this as our data source.

### Model
A model that describes a task.

### View
TaskCell contains view information about the cell. It houses the model's object within the cell in order for the data to be displayed.