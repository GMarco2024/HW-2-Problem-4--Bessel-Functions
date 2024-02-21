import SwiftUI

struct ContentView: View {
    @State private var N1: String = ""
    @State private var results: [String] = []

    var body: some View {
        ScrollView {
            VStack {
                Text("Problem 4a - Upward and Downward Recursion")
                    .font(.title)
                    .underline()
                
                Text("Calculate j_l(x) for the first 25 l values for x = N")
                    .font(.headline)
                    .fontWeight(.regular)
                    .italic()
                    .padding(.bottom, 5)
                
                TextField("Enter N", text: $N1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 20)

                Button("Calculate") {
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
        // This clears calculated results.
        results.removeAll()
        
        // Calculate using upward and downward recursion
        let upwardResults = calculateUpwardRecursion(x: x, lMax: 25)
        let downwardResults = calculateDownwardRecursion(x: x, lMax: 25)
        
        // Calculate relative error
        let relativeErrors = calculateRelativeError(upwardVals: upwardResults, downwardVals: downwardResults)
        
        // Combine and format the results
        for l in 0..<upwardResults.count {
            let resultString = "l = \(l), x = \(x), Downward: \(String(format: "%7.5e", downwardResults[l])), Upward: \(String(format: "%7.5e", upwardResults[l])), Relative Error: \(String(format: "%7.5e", relativeErrors[l]))"
            results.append(resultString)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
