//
//  RelativeError.swift
//  HW2 Problem 4 - Bessel Function
//
//  Modified by Marco Gonzalez 2/20/24
//

import Foundation

func calculateRelativeError(upwardVals: [Double], downwardVals: [Double]) -> [Double] {
    var relativeErrors = [Double]()
    
    for (up, down) in zip(upwardVals, downwardVals) {
        let error = abs(up - down) / (abs(up) + abs(down))
        relativeErrors.append(error)
    }
    
    return relativeErrors
}
