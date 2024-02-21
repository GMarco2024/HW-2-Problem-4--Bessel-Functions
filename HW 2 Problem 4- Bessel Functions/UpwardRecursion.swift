//
//  UpwardRecursion.swift
//  HW 2 Problem 4- Bessel Functions
//
//  Created by Marco on 2/21/24.
//

import Foundation


//                      2l + 1
//[    j(x)  =        ---------- j (x)    -  j        (x) ]
//     l + 1               x      l            l - 1
                           
func calculateUpwardRecursion(x: Double, lMax: Int) -> [Double] {
    var results = [Double](repeating: 0.0, count: lMax + 1)
    
    if x == 0 {
        results[0] = 1.0
        return results
    }
    
    results[0] = sin(x) / x
    if lMax >= 1 {
        results[1] = sin(x) / (x*x) - cos(x) / x
    }
    
    for l in 1..<lMax {
        results[l + 1] = ((2.0 * Double(l) + 1.0) / x) * results[l] - results[l - 1]
    }
    
    return results
}

