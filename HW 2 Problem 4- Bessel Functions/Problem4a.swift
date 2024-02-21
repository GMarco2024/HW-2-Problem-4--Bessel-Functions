//
//  Problem4a.swift
//  HW2 Problem 4 - Bessel Function
//
//  Modified by Marco Gonzalez 2/20/24
//

import Foundation

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
    
    // Upward recursion
    for l in 1..<lMax {
        results[l + 1] = ((2.0 * Double(l) + 1.0) / x) * results[l] - results[l - 1]
    }
    
    return results
}

/// Calculates the spherical Bessel function of the first kind using downward recursion.
/// - Parameters:
///   - x: The value of x.
///   - lMax: The maximum order of the Bessel function for starting the recursion.
/// - Returns: An array containing the values of j_l(x) for l = 0 to lMax.
/// Note: Downward recursion may suffer from numerical instability for large lMax.
func calculateDownwardRecursion(x: Double, lMax: Int) -> [Double] {
    var results = [Double](repeating: 0.0, count: lMax + 2) // Extra space for initial guess
    
    // Initial guess for starting the recursion
    results[lMax + 1] = 0.0
    results[lMax] = 1.0
    
    // Downward recursion
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
