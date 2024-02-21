//
//  DownwardRecursion.swift
//  HW 2 Problem 4- Bessel Functions
//
//  Created by Marco on 2/21/24.
//

import Foundation

func calculateDownwardRecursion(x: Double, lMax: Int) -> [Double] {
    var results = [Double](repeating: 0.0, count: lMax + 2) // Extra space for initial guess
    
    // Initial guess for starting the recursion
    results[lMax + 1] = 0.0
    results[lMax] = 1.0
    
    for l in (0..<lMax).reversed() {
        results[l] = ((2.0 * Double(l) + 1.0) / x) * results[l + 1] - results[l + 2]
    }
    
    // Normalization with j0(x) since downward recursion does not guarantee correct magnitude
    let scale = sin(x) / x / results[0]
    for l in 0...lMax {
        results[l] *= scale
    }
    
    return Array(results[0...lMax])
}
