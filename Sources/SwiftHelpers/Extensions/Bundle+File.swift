//
//  Bundle+File.swift
//  SwiftExtensions
//
//  Created by tonezone on 24/03/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import Foundation

public extension Bundle {
    func load<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file) from bundle.")
        }
        let decoder = JSONDecoder()
        do {
            let value = try decoder.decode(T.self, from: data)
            return value
        } catch(let error) {
            fatalError("failed to decode \(file) from bundle data. \(error.localizedDescription)")
        }
    }
    
    func loadString(from file: String) -> String {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle.")
        }
        do {
            return try String(contentsOf: url, encoding: .utf8)
        } catch(let error) {
            fatalError("failed to convert \(file) into string. \(error.localizedDescription)")
        }
    }
}
