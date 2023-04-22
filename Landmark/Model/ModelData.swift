//
//  ModelData.swift
//  Landmark
//
//  Created by 김요한 on 2023/04/23.
//

import Foundation

// JSON데이터에서 가져온 데이터를 초기화해주는 배열
var landmarks: [Landmark] = load("landmarkData.json")


// 앱의 기본 번들에서 지정된 이름으로 JSON데이터를 가져오는 메서드
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}