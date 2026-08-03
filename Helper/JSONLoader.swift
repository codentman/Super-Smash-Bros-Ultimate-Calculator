//
//  JSONhelper.swift
//  SSBU Calculator
//
//  Created by Cody Olivares on 7/15/26.
//

import Foundation

struct JSONLoader {
    static func load<T: Decodable>(_ filename: String, as type: T.Type) throws -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Couldn't find \(filename).json")
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
