//
//  ContentView.swift
//  HW2 Problem 3 - Bessel Function
//
//  Modified by Marco Gonzalez 2/20/24
//

import SwiftUI

struct ContentView: View {
    @State private var N1: String = ""
    @State private var results: [String] = [] // Combined results

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Problem 4a - Upward and Downward Recursion")
                    .font(.title)
                    .underline()
                
                Text("Calculate j_l(x) for the first 25 (l) values for (x) = N")
                    .font(.headline)
                    .fontWeight(.regular)
                    .italic()
                    .padding(.bottom, 5)
                
                TextField("Enter N", text: $N1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 20)

                Button("Calculate") {
                    // Ensure the input can be converted to a Double
                    if let xValue = Double(N1) {
                        calculateBesselFunctions(x: xValue)
                    }
                }
                .padding(.bottom, 20)
                
                ForEach(results, id: \.self) { result in
                    Text(result)
                }
            }
        }
        .padding()
    }

    func calculateBesselFunctions(x: Double) {
        // Clear previous combined results
        results.removeAll()
        
        // Calculate using upward and downward recursion
        let upwardResults = calculateUpwardRecursion(x: x, lMax: 25)
        let downwardResults = calculateDownwardRecursion(x: x, lMax: 25)
        
        // Combine and format the results
        for l in 0..<upwardResults.count {
        
        let resultString = "x = \(x), l = \(l), Downward: \(downwardResults[l]), Upward: \(upwardResults[l])"
            
            results.append(resultString)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
