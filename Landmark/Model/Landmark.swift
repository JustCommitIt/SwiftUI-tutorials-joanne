//
//  Landmark.swift
//  Landmark
//
//  Created by 김요한 on 2023/04/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // landmark 구조체의 사용자는 이미지 자체만 관심이 있으므로 속성을 private으로 선언
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // 다음 단계의 공용 계산 속성을 만드는 데만 사용하므로 private
    private var coordinates: Coordinates
    // Mapkit과 호환성을 위한 프레임웤
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longtitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longtitude: Double
    }
}


