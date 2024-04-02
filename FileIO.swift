import Foundation

enum ErrorCases: Error {
    case invalidNumeral
}
// Checks if argument is int.
func isNumeric(possibleInt: String) -> Bool {
    return Int(possibleInt) != nil
}

do {
    // Initialize file path and open input file.
    let filePath = "input.txt"
    let file = try String(contentsOfFile: filePath)
    let fileLines = file.components(separatedBy: .newlines)

    // Parse every single line into list components
    for singleLine in fileLines {
        // Case input line is empty.
        if !singleLine.isEmpty {
            var parsedInputArray = singleLine.components(separatedBy: " ")
            var finalOutput: [String] = []
            var oneSingleLineData = "0"
            var bufferString = ""
            // For each line element.
            for parsedInputString in parsedInputArray {
                // If indexed element is numeric.
                if isNumeric(possibleInt: parsedInputString) {
                    // Check and convert both indexed element and line data to integer.
                    if let numVal = Int(parsedInputString), let boolChecker = Int(oneSingleLineData) {
                        let sumOfNumSingleLine = numVal + boolChecker
                        oneSingleLineData = String(sumOfNumSingleLine)
                    }
                } else {
                    // Add the line data to output array.
                    bufferString += " " + parsedInputString
                    oneSingleLineData = "Error: \(bufferString) is not a number."
                }
            }
            // Add the final result to an output list.
            finalOutput.append(oneSingleLineData)
            for outputLine in finalOutput {
                print(outputLine)
            }
        } else {
            print("Error: Line is empty.")
        }
    }
} catch {
    print("Error: No file found.")
}
