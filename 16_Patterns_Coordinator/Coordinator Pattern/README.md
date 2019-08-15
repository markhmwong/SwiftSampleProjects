#  16. Coordinator Pattern

## Overview

This project applies the coordinator pattern with two sub viewcontrollers.

## Coordinator Pattern

Coordinator Pattern introduces a technique to control the navigation function of an application. Traditionally, navigation is controlled by the ViewController, but this tightly couples viewcontrollers together that can't be easily exchanged at a later stage, much like a literal chain that joins two view controllers together. A coordinator pattern allows flexibility and removes the chains by removing the handling of the navigation code (.pushViewController and UINavigationControllerDelegates in this case) and moving this into a class called the Coordinator. Here we keep track of the coordinators by using a list of child coordinators.

## Description
This is a fresh project and doesn't follow on from project 15. We use a main coordinator and a child coordinator to manage and control the navigation flow. Base off of Paul Hudson's Coordinator Pattern videos on youtube

[How to use the Coordinator pattern in iOS](https://www.youtube.com/watch?v=7HgbcTqxoN4)
[Advanced Coordinators in iOS](https://www.youtube.com/watch?v=ueByb0MBMQ4&t=603s)

This is almost an exact copy of Paul's code however I added an additional sub view controller (DisplayViewController) for fun which is controller from the SettingsCoordinator. I kept the DisplayViewController within the SettingsCoordinator as it's part of the Settings Navigation. While if i made another viewcontroller as a secondary view, I'd sit that within the MainCoordinator and create a new Coordinator giving it a tree like structure.

I.e.

           |--------  ViewController--------|
           |                                |
           |                                |
    SettingsViewController       Secondary ViewController
           |
           |
           |
    DisplayViewController


## Structure

    ViewController
        SettingsViewController
            DisplayViewController
    Coordinator
        MainCoordinator
        SettingsCoordinator


