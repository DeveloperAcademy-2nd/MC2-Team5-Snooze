//
//  ViewController2.swift
//  OnJeWa
//
//  Created by Kim SungHun on 2023/04/28.
//

//
//  ViewController.swift
//  OnJeWa
//
//  Created by Kim SungHun on 2023/04/25.
//

import CoreLocation
import UIKit
import UserNotifications

import OnJeWaCore
import WidgetKit

class ViewController3: BaseViewController, CLLocationManagerDelegate {
    
//    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 100 // 반경 100m
    
    let center = CLLocationCoordinate2D(latitude: 36.0167547, longitude: 129.3227777)
    
    // 1
    lazy var locationManager = makeLocationManager()
    // 2
    private func makeLocationManager() -> CLLocationManager {
      // 3
      let manager = CLLocationManager()
      // 4
      return manager
    }
    
    
    // 1
    private func makeStoreRegion() -> CLCircularRegion {
      // 2
      let region = CLCircularRegion(
        center: center,
        radius: 2,
        identifier: UUID().uuidString)
      // 3
      region.notifyOnEntry = true
      // 4
      return region
    }
    
    lazy var storeRegion = makeStoreRegion()

    // 1
    func validateLocationAuthorizationStatus() {
      // 2
      switch locationManager.authorizationStatus {
      // 3
      case .notDetermined, .denied, .restricted:
        // 4
        print("Location Services Not Authorized")
      // 5
      case .authorizedWhenInUse, .authorizedAlways:
        // 6
        print("Location Services Authorized")
      default:
        break
      }
    }
    
//    func requestNotification() {
//        locationManager.validateLocationAuthorizationStatus()
//
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
//            if let error = error {
//                print("Error requesting authorization for notifications: \(error.localizedDescription)")
//            } else if granted {
//                print("Notification authorization granted")
//            } else {
//                print("Notification authorization denied")
//            }
//        }
//
//        locationManager.delegate = self
//        locationManager.requestAlwaysAuthorization()
//
//        let center = CLLocationCoordinate2D(latitude: 36.0167547, longitude: 129.3227777)
//        let region = CLCircularRegion(center: center, radius: regionRadius, identifier: "Geofence")
//        region.notifyOnEntry = true
//        region.notifyOnExit = true
//
//        locationManager.startMonitoring(for: region)
//
//        let content = UNMutableNotificationContent()
//        content.title = "지역 모니터링"
//        content.body = "지정한 지역에 들어왔습니다."
//        content.sound = .default
//
//        let request = UNNotificationRequest(identifier: "Geofence", content: content, trigger: nil)
//        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//
//        print("???")
//        triggerTaskAssociatedWithRegionIdentifier(regionID: identifier)

        
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("사용자가 지정한 지역에 들어왔습니다.")
        // 지정한 지역에 들어왔을 때 수행할 작업
        
        let content = UNMutableNotificationContent()
        content.title = "지역 모니터링"
        content.body = "지정한 지역에 들어왔습니다."
        content.sound = .default
        
        let request = UNNotificationRequest(identifier: "Geofence", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("사용자가 지정한 지역을 벗어났습니다.")
        // 지정한 지역을 벗어났을 때 수행할 작업
        
        let content = UNMutableNotificationContent()
        content.title = "지역 모니터링"
        content.body = "지정한 지역을 벗어났습니다."
        content.sound = .default
        
        let request = UNNotificationRequest(identifier: "Geofence", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
    //            WidgetCenter.shared.reloadAllTimelines()
    
}
