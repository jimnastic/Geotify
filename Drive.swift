//
//  Drive.swift
//  Geotify
//
//  Created by James May on 9/9/17.
//  Copyright © 2017 Ken Toh. All rights reserved.
//

import Foundation

enum DriveStateType {
  case new
  case monitoring
  case driving
  case arrived
  case timedOut
}

enum DriveDirectionType {
  case toWork
  case toHome
}

class Drive {
  var state = DriveStateType.new
  var direction: DriveDirectionType?
  var startTime: NSDate?
  var arrivalTime: NSDate?
  //  var travelTime = arrivalTime - startTime
  // recommendedStartTime
  // estimatedArrivalTime
  // estimatedTravelTime()
  // estimatedTimeRemaining()
  // actualTravelTimeVsEstimated()
  // actualTravelTimeVsTypical()
  // suggestions
  
  
  func startMonitoring(direction:DriveDirectionType)->Bool{
    if state == .new {
      state = .monitoring
      return true
    } else {
      return false
    }
  }
  
  func startDrive(time:NSDate)->Bool{
    if state == .monitoring {
      state = .driving
      startTime = time
      return true
    } else {
      return false
    }
  }
  
  func cancelDrive()->Bool{
    if state == .driving {
      state = .monitoring
      return true
    } else {
      return false
    }
  }

  func arrived(time:NSDate)->Bool{
    if state == .driving {
      state = .arrived
      arrivalTime = time
      return true
    } else {
      return false
    }
  }
  
  func timeOut()->Bool{
    if (state == .new) || (state == .monitoring)  || (state == .driving) {
      state = .timedOut
      return true
    } else {
      return false
    }
  }
}
/*
* create()
  * openCommuteWindow()
  * Start()
  * Stop-cancelled()
  * Stop-arrived()
  * CloseCommuteWindow()
  * ----
*/
