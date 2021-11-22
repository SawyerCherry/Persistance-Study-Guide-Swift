//
//  File.swift
//  Study Guide
//
//  Created by Erick Sanchez on 11/1/21.
//

import Foundation

/// File store that represents one file in the app's Sandbox
///
/// Here's an exmaple storing an image in the library cache:
/// ```
/// func cacheUserProfileImage(_ image: UIImage) {
///     let userProfileImageFile = FileManagerFile(location: .libraryCache, filename: "UserProfile.png")
///     guard let userProfileImageData = image.pngData() else {
///         return print("Failed to create image data from image")
///     }
///
///     userProfileImageFile.save(contents: userProfileImageData)
/// }
/// ```
class FileManagerFile {
    enum Location {
        case documents
        case library
        case libraryCache
        case temp
    }
    var fileName: String
    
    init(location: Location, filename: String) {
        self.fileName = filename
    }
    
    init(location: Location, subdirectory: String, filename: String) {
        // TODO: Stretch Challenge: create folders if they do not exists in the save methods of this class
        
        self.fileName = filename
    }
    
    /// Store the given string in the file
    ///
    /// - Note: if the file does not exist, this method will create it. Otherwise, this
    /// method will override the file's contents
    func save(contents: String) {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory,
                                       in: .userDomainMask)
        
        if let documentDirectory: URL = urls.first {
            let documentURL = documentDirectory.appendingPathComponent("txtFile.txt")
            // data you want to write to file
            let data: Data? = contents.data(using: .utf8)
            do{
                try data!.write(to: documentURL, options: .atomic)
            }catch{
                
            }
        }
    }
    
    /// Store the given encodable contents in the file
    ///
    /// - Note: if the file does not exist, this method will create it. Otherwise, this
    /// method will override the file's contents
    func save<T: Encodable>(contents: T) {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory,
                                       in: .userDomainMask)
        if let documentDirectory: URL = urls.first {
            let documentURL = documentDirectory.appendingPathComponent("txtFile.txt")
            // data you want to write to file
            let encoder = JSONEncoder()
            let data: Data? = try! encoder.encode(contents)
            do {
                try data!.write(to: documentURL, options: .atomic)
            } catch {
                // some error
            }
        }
    }
    
    /// Store the given data in the file
    ///
    /// - Note: if the file does not exist, this method will create it. Otherwise, this
    /// method will override the file's contents
    func save(contents: Data) {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory,
                                       in: .userDomainMask)
        if let documentDirectory: URL = urls.first {
            let documentURL = documentDirectory.appendingPathComponent("txtFile.txt")
            // data you want to write to file
            let data: Data? = contents
            do{
                try data!.write(to: documentURL, options: .atomic)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    /// Read the contents of the file as `String`
    ///
    /// - Note: if the file does not exist, this method will return nil
    func contents() -> String? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentDirectory: URL = urls.first {
            let documentURL = documentDirectory.appendingPathComponent("txtFile.txt")
            do {
                print(documentURL)
                let content = try String(contentsOf: documentURL, encoding: .utf8)
                print(content)
                return content
            } catch let error {
                print(error.localizedDescription)
                return nil
            }
        }
        return nil
    }
    
    /// Read the contents of the file as the given decodable type
    ///
    /// - Note: if the file does not exist, this method will return nil. Or, if the stored contents
    /// is not the same as the decodable type, this method will return nil
    func contents<T: Decodable>() -> T? {
        fatalError("not implemented, yet")
    }
    
    /// Read the contents of the file as `Data`
    ///
    /// - Note: if the file does not exist, this method will return nil
    func contents() -> Data? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        
        if let documentDirectory: URL = urls.first {
            let documentURL = documentDirectory.appendingPathComponent("txtFile.txt")
            do {
                print(documentURL)
                let content = try Data(contentsOf: documentURL)
                print(content)
                return content
            } catch let error {
                print(error.localizedDescription)
                return nil
            }
        }
        return nil
    }
    
    /// Delete the file
    ///
    /// - Note: if the file does not exist, this method does nothing
    func delete() {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let documentDirectory: URL = urls.first {
            let documentURL = documentDirectory.appendingPathComponent(fileName)
            
            
            if fileManager.fileExists(atPath: fileName){
                do {
                    print("deleting at \(documentURL)")
                    try fileManager.removeItem(atPath: fileName)
                } catch {
                    print("file does not exist")
                }
                
            } else {
                print("error")
            }
        }
        
    }
}
