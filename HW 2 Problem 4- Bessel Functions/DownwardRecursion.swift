//
//  DownwardRecursion.swift
//  HW 2 Problem 4- Bessel Functions
//
//  Created by Marco on 2/21/24.
//

import Foundation

//                 2l + 1
//[    j(x)  =    ----------   j (x)    -  j        (x) ]
//     l - 1          x          l            l + 1



// Downward Recursion for Spherical Bessel Functions
func calculateDownwardRecursion(x: Double, lMax: Int) -> [Double] {
    var results = [Double](repeating: 0.0, count: lMax + 2) // Extend array for initial guess

    // Improved initial guess
    
    results[lMax + 1] = 0.0
    results[lMax] = 1.0
    
    // Execute downward recursion
    
    for l in (0..<lMax).reversed() {
        results[l] = ((2.0 * Double(l) + 1.0) / x) * results[l + 1] - results[l + 2]
    }

    // Precise normalization. this allows j0(x) to be most accurate for normalization
    
    let j0 = sin(x) / x
    let scale = j0 / results[0]
    for l in 0...lMax {
        results[l] *= scale
    }
    
    return Array(results[0...lMax])
}
