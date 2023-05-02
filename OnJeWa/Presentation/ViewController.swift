//
//  ViewController.swift
//  OnJeWa
//
//  Created by Kim SungHun on 2023/04/25.
//

import CoreLocation
import UIKit

import OnJeWaCore
import Photos
import WidgetKit

class ViewController: BaseViewController, CLLocationManagerDelegate {
    
    let latitudeLabel = UILabel()
    let longitudeLabel = UILabel()
    let coreDataLabel = UILabel()
    
    let locationManager = CLLocationManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UserDefaults.shared.set(1, forKey: "testKeyInt")
        
        view.backgroundColor = .blue
        
        latitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        longitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        coreDataLabel.translatesAutoresizingMaskIntoConstraints = false
        
        latitudeLabel.text = "latitudeLabel"
        longitudeLabel.text = "longitudeLabel"
        coreDataLabel.text = String(UserDefaults.shared.integer(forKey: "testKeyInt"))
        
        [latitudeLabel, longitudeLabel, coreDataLabel].forEach {
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            latitudeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            latitudeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            longitudeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            longitudeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
        ])
        
        NSLayoutConstraint.activate([
            coreDataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coreDataLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
        ])
        
        
        locationManager.delegate = self
        
        // 위치 권한 요청
        locationManager.requestWhenInUseAuthorization()
        locationManager.allowsBackgroundLocationUpdates = true
        
    }
    
    // 위치 권한 변경 시 호출됨
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            // 위치 업데이트 시작
            locationManager.startUpdatingLocation()
        }
    }
    
    // 위치 정보 업데이트 시 호출됨
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        //
        //        // 현재 위치의 위도, 경도
        let currentLatitude = location.coordinate.latitude
        let currentLongitude = location.coordinate.longitude
        //
        //        // 이제 현재 위치를 이용하여 다른 작업을 수행할 수 있습니다.
        //
        //        print("currentLatitude \(currentLatitude)")
        //        print("currentLongitude \(currentLongitude)")
        //
        
        latitudeLabel.text = String(describing: currentLatitude)
        longitudeLabel.text = String(describing: currentLongitude)
        
        //
        ////        UserDefaults.shared.set(currentLatitude, forKey: "testKey")
        //
        //
        //        let coordinate1 = CLLocation(latitude: 36.014113962896225, longitude: 129.32585976153368)
        //
        //        // 반경 100m에 해당하는 거리
        //        let radius = 100.0
        //
        //        // 반경 내의 모든 지점 구하기
        //        let locations: [CLLocation] = {
        //            // 0부터 360도까지 10도 간격으로 좌표 생성
        //            let angles = stride(from: 0, to: 360, by: 10).map { Double($0) }
        //
        //            // 반경 내의 모든 지점 생성
        //            return angles.map { angle in
        //                let dx = radius * cos(angle * .pi / 180.0)
        //                let dy = radius * sin(angle * .pi / 180.0)
        //                let lat = coordinate1.coordinate.latitude + (dy / 111_111.0)
        //                let lng = coordinate1.coordinate.longitude + (dx / (111_111.0 * cos(coordinate1.coordinate.latitude * .pi / 180.0)))
        //                return CLLocation(latitude: lat, longitude: lng)
        //            }
        //        }()
        //
        //        UserDefaults.shared.set("Close enough", forKey: "testKey")
        //
        //        var max = 0
        //        for getLocation in locations {
        //            let distance = location.distance(from: getLocation)
        //            if max < Int(distance) {
        //                max = Int(distance)
        //            }
        //            if distance >= radius {
        //                // 반경 내에 있는 지점에 대한 처리
        //            }
        //        }
        //        print("max \(max)")
        
        
//        UserDefaults.shared.set("Close enough", forKey: "testKey")
        
//        // 카페테리아의 좌표
//        let homeCoordinate = CLLocation(latitude: 36.014113962896225, longitude: 129.32585976153368)
        
        // 메인랩 중앙의 좌표
//        let homeCoordinate = CLLocation(latitude: 36.01433048263596, longitude: 129.32564890935953)
        
        // 커뮤니티센터 좌표
//        let homeCoordinate = CLLocation(latitude: 36.0167547, longitude: 129.3227777)
        
        // 도서관 좌표
        let homeCoordinate = CLLocation(latitude: 36.01276296703263, longitude: 129.32502482232786)
        
        // 반경 100m에 해당하는 거리
        let radius = 100.0
        
        // 현재 위치의 좌표
        let currentCoordinate = location
        
        // 현재 위치와 집의 거리 계산
        let distanceFromHome = CLLocation(latitude: currentCoordinate.coordinate.latitude, longitude: currentCoordinate.coordinate.longitude)
            .distance(from: CLLocation(latitude: homeCoordinate.coordinate.latitude, longitude: homeCoordinate.coordinate.longitude))
        
        print("distanceFromHome \(distanceFromHome)")
        print("currentCoordinate.coordinate.latitude \(currentCoordinate.coordinate.latitude)")
        
        UserDefaults.shared.set("\(currentCoordinate.coordinate.latitude)", forKey: "testKey")
        
        var testValue = UserDefaults.shared.integer(forKey: "testKeyInt")
        testValue += 1
        UserDefaults.shared.set(testValue, forKey: "testKeyInt")
        
        coreDataLabel.text = String(testValue)
        
//        if distanceFromHome > 30 {
//            // 집에서 100m 이상 멀어졌을 때 액션 처리
//            UserDefaults.shared.set("Too far", forKey: "testKey")
//        }
        
        WidgetCenter.shared.reloadAllTimelines()

    }
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        // Do any additional setup after loading the view.
    //        view.backgroundColor = .yellow
    //
    //        let locationManager = CLLocationManager()
    //        locationManager.requestWhenInUseAuthorization()
    //
    //        if CLLocationManager.locationServicesEnabled() {
    //            locationManager.delegate = self
    //            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    //            locationManager.startUpdatingLocation()
    //        }
    //
    //        let coordinate1 = CLLocation(latitude: 37.123, longitude: -122.123)
    //        let coordinate2 = CLLocation(latitude: 37.456, longitude: -122.456)
    //        let distance = coordinate1.distance(from: coordinate2)
    //
    //
    //        if distance > 100 {
    //            print("Too far")
    //        } else {
    //            print("Close enough")
    //        }
    //    }
    
    
}

extension UserDefaults {
    static var shared: UserDefaults {
        let appGroupId = "group.ungchun.onjewa"
        return UserDefaults(suiteName: appGroupId)!
    }
}
