#  16. Coordinator Pattern

## Overview

Coordinator Pattern introduces a technique to control the navigation function of an application. Traditionally, navigation is controlled by the ViewController, but this tightly couples viewcontrollers together that can't be easily exchanged at a later stage, much like a literal chain that joins two view controllers together. A coordinator pattern allows flexibility and removes the chains by removing the handling of the navigation code (.pushViewController and UINavigationControllerDelegates in this case) and moving this into a class called the Coordinator. Here we keep track of the coordinators by using a list of child coordinators.

## 

