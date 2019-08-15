#  15. Architecture Patterns Model View Controller (MVVM)

## Overview

In conjunction with the MVVM pattern we can further the existing codebase by applying a Protocol to our viewModels. 

## Protocols

At the top level, Protocols provides a mandate to a class or multiple classes, with functions and variables. It is these functions and variables that must be applied to the class. This streamlines common classes together (keeps it all in order) and reduces repetitive code that might otherwise differ but ultimately do perform the same task. 

## Description

Since the previous project, we've reestablished our datasource. We used a list of tasks within the viewModel to represent data in the UITableView in the MVVM project but now the datasource has been placed inside the ViewController as the variable `data` as an array of CellRepresentable (of [CellRepresentable]). 

CellRepresentable represents the viewModel of the UITableView cell by defining two things

- rowHeight
- cellInstance method that returns a UITableViewCell instance

By applying this, we can now create the cell instance within the viewModel and reduces code in the UITableView DataSource.

Previously without Protocols in a UITableViewDataSource method
`let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TaskCell
cell.task = task
return cell`

Now it's merely a one liner, where the protocol hides the creation of the cell instance.
`return data[indexPath.row].cellInstance(tableView, indexPath: indexPath)`

It also places code where the view is transformed for the user inside the viewModel where it belongs.

## Structure

ViewController
    TableView
    TableView Datasource (var data)

Model
    Task
    
ViewModel (CellRepresentable)
    TableView Property (rowHeight)
    CellInstance creation

View
    TaskCell
    
Protocol
    CellRepresentable

### ViewController
The Viewcontroller houses the datasource and also initialises the data for the table. Typically, the data would be sourced externally but in this case we'll create sample data in the loadData() function and use this as our data source.

### Model
A model that describes a task.

### View
TaskCell contains view information about the cell. It houses the model's object within the cell in order for the data to be displayed.

### Protocol
CellRepresentable defines the rowHeight and the cell instance for each cell.
