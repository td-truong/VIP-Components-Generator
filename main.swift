//
//  Main.swift
//  VIP-Implementation-Swift
//
//  Created by Machintosh on 10/08/2021.
//

import Foundation

// INPUT
print("Module name (e.g UserList): ", terminator: "")
let moduleName = readLine() ?? ""

print("Project name: ", terminator: "")
let projectName = readLine() ?? ""

let author = NSFullUserName()

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd/MM/yyyy"
let date = dateFormatter.string(from: Date())

// START
print("Processing...")

let currentDirectory = FileManager.default.currentDirectoryPath
let components = Component.allCases

let placeholderModuleName = "MODULE_PLACEHOLDER"
let placeholderModuleDirectory = currentDirectory.appending("/\(placeholderModuleName)")

let moduleDirectory = currentDirectory.appending("/\(moduleName)")

// Create module directory
if FileManager.default.fileExists(atPath: moduleDirectory) {
    try? FileManager.default.removeItem(atPath: moduleDirectory)
}
try? FileManager.default.createDirectory(atPath: moduleDirectory, withIntermediateDirectories: true, attributes: nil)

// Process files
for component in components {
    // Replace contents
    let placeholderFile = component.build(moduleDirectory: placeholderModuleDirectory, moduleName: placeholderModuleName).file
    let originalString = (try? String(contentsOfFile: placeholderFile, encoding: .utf8)) ?? ""
    let replacedString = originalString
        .replacingOccurrences(of: "MODULE_PLACEHOLDER", with: moduleName)
        .replacingOccurrences(of: "MODULE_PROJECT_NAME", with: projectName)
        .replacingOccurrences(of: "MODULE_AUTHOR", with: author)
        .replacingOccurrences(of: "MODULE_DATE", with: date)
    
    // Create new files
    let (folder, file) = component.build(moduleDirectory: moduleDirectory, moduleName: moduleName)
    try? FileManager.default.createDirectory(atPath: folder, withIntermediateDirectories: true, attributes: nil)
    FileManager.default.createFile(atPath: file, contents: replacedString.data(using: .utf8), attributes: nil)
}

print("\u{001B}[0;32mDONE!")
print("Output folder: \(moduleName)/")

enum Component: CaseIterable {
    case view
    case interactor
    case presenter
    case router
    
    static let folderNameAndFileSuffix: [Component: (folder: String, fileSuffix: String)] = [
        .view: ("View", "Controller"),
        .interactor: ("Interactor", "Interactor"),
        .presenter: ("Presenter", "Presenter"),
        .router: ("Router", "Router"),
    ]
    
    func build(moduleDirectory: String, moduleName: String) -> (parentFolder: String, file: String) {
        guard let (folder, fileSuffix) = Self.folderNameAndFileSuffix[self] else {
            return ("", "")
        }
        let parentFolder = moduleDirectory.appending("/\(folder)")
        let file = parentFolder.appending("/\(moduleName)\(fileSuffix).swift")
        return (parentFolder, file)
    }
}
