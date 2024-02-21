//
//  RelativeError.swift
//  HW2 Problem 4 - Bessel Function
//
//  Modified by Marco Gonzalez 2/20/24
//

import Foundation

//                           |up  -  down|
//      Relative Error  =  -----------------
//                          |up|  +  |down|

func calculateRelativeError(upwardValues: [Double], downwardValues: [Double]) -> [Double] {
    var relativeErrors = [Double]()
    
    for (up, down) in zip(upwardValues, downwardValues) {
        let error = abs(up - down) / (abs(up) + abs(down))
        relativeErrors.append(error)
    }
    
    return relativeErrors
}
