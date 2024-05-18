//
//  HTADocument.swift
//  HTAView
//
//  Created by CharlieCat on 18. 05. 2024.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

// Define this document's type.
extension UTType {
    static let htaAppDocument = UTType(exportedAs: "space.charliecat.HTAView.hta")
}

final class HTADocument: ReferenceFileDocument {

    typealias Snapshot = HTA
    
    @Published var htaApp: HTA
    
    // Define the document type this app is able to load.
    /// - Tag: ContentType
    static var readableContentTypes: [UTType] { [.htaAppDocument] }
    
    /// - Tag: Snapshot
    func snapshot(contentType: UTType) throws -> HTA {
        htaApp // Make a copy.
    }

    // Load a file's contents into the document.
    /// - Tag: DocumentInit
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self.htaApp = HTA()
        self.htaApp.html = String(decoding: data, as: UTF8.self)
    }
    
    /// Saves the document's data to a file.
    /// - Tag: FileWrapper
    func fileWrapper(snapshot: HTA, configuration: WriteConfiguration) throws -> FileWrapper {
        print("Trying to save the HTA lol")
        let fileWrapper = FileWrapper(regularFileWithContents: Data(snapshot.html!.utf8))
        return fileWrapper
    }
}

