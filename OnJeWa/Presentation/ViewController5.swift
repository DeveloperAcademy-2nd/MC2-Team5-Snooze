//
//  ViewController5.swift
//  OnJeWa
//
//  Created by Kim SungHun on 2023/04/28.
//

import UIKit
import CoreLocation
import UserNotifications

// 이거 iOS 13 이후부터는 항상 불가능 -> 백그라운드에서 계속 세팅하다보면 팝업이 하나 더뜸 (https://sosoingkr.tistory.com/113)
// + 온보딩에 설정 -> 항상으로 세팅하라는 안내 필요할지도
// 권한도 위에 블로그 적힌 부분 3개면 될듯
// 백그라운드 모드도 위에 블로그 보고 세팅
// 앱델리게이트는 전부 다 들어가야할듯 코드 -> 종권좌 블로그 확인

// 앱 메인에서 세팅하는 코드 들어가야할듯

class ViewController5: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .badge, .sound]
        ) {
            success, error in
        }
        
        locationManager.requestAlwaysAuthorization()
        locationManager.allowsBackgroundLocationUpdates = true
        
        // 위치 서비스 정확도 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        // 위치 서비스 업데이트 시작
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            // 범위를 설정하는 기준좌표 -> 예를 들어 우리 앱에서는 집 혹은 회사
            let center = CLLocationCoordinate2D(latitude: 36.0167547, longitude: 129.3227777)
            
            // 2km의 원형 영역
            let region = CLCircularRegion(center: center, radius: 2000.0, identifier: "Geofence")
            
            region.notifyOnEntry = true
            region.notifyOnExit = true
            
            locationManager.startMonitoring(for: region)
        }
    }
    
    // 지정한 지역에 들어왔을 때 수행할 작업
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("사용자가 지정한 지역에 들어왔습니다.")
        
        let content = UNMutableNotificationContent()
        content.title = "지역 모니터링"
        content.body = "지정한 지역에 들어왔습니다."
        content.sound = .default
        
        let request = UNNotificationRequest(identifier: "Geofence", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    // 지정한 지역을 벗어났을 때 수행할 작업
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("사용자가 지정한 지역을 벗어났습니다.")
        
        let content = UNMutableNotificationContent()
        content.title = "지역 모니터링"
        content.body = "지정한 지역을 벗어났습니다."
        content.sound = .default
        
        let request = UNNotificationRequest(identifier: "Geofence", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
