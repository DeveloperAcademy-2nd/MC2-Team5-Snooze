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
import UserNotifications

class ViewController4: BaseViewController {
    
    // 사용자에게 알림 권한 요청
    func requestAuthNoti() {
        let notiAuthOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
        userNotificationCenter.requestAuthorization(options: notiAuthOptions) { (success, error) in
            if let error = error {
                print(#function, error)
            }
        }
    }
    
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestAuthNoti()
        
        view.backgroundColor = .yellow
        
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .badge, .sound]) { success, error in
        }
        
//        let content = UNMutableNotificationContent()
//        content.title = "Stay hydrated"
//        content.body = "It's time for a glass of water"
//        content.sound = UNNotificationSound(named: UNNotificationSoundName("water.wav"))

        
//        var dateComponents = DateComponents()
//        dateComponents.hour = 7
//        dateComponents.minute = 30
        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10*60, repeats: false)
        
//        let center = CLLocationCoordinate2D(latitude: 51.3396955, longitude: 12.3730747)
        
//        let center = CLLocationCoordinate2D(latitude: 36.0167547, longitude: 129.3227777)
//        let region = CLCircularRegion(center: center, radius: 20, identifier: "M3T")
//        region.notifyOnEntry = true
//        region.notifyOnExit = true
//        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
//        let center = CLLocationCoordinate2D(latitude: 37.335400, longitude: -122.009201)
//        let region = CLCircularRegion(center: center, radius: 2000.0, identifier: UUID().uuidString)
//        region.notifyOnEntry = true
//        region.notifyOnExit = true
//        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)

        
//        // 알림이 trigger되는 시간 설정
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
//
        let notiContent = UNMutableNotificationContent()
           notiContent.title = "알림 title"
           notiContent.body = "알림 body"
           notiContent.userInfo = ["targetScene": "splash"] // 푸시 받을때 오는 데이터
//
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: notiContent,
            trigger: trigger
        )
//
//        userNotiCenter.add(request) { (error) in
//            print(#function, error)
//        }
        
        
//        let id = UUID().uuidString
//        let request = UNNotificationRequest(
//            identifier: id, content: content, trigger: trigger)

        userNotificationCenter.add(request) { error in
            print("????")
            if let error = error {
                // handle error
            }
        }


        
//        requestNotificationAuthorization()
//        sendNotification(seconds: 10)
        
    }
    
//    func requestNotificationAuthorization() {
//        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
//
//        userNotificationCenter.requestAuthorization(options: authOptions) { success, error in
//            if let error = error {
//                print("Error: \(error)")
//            }
//        }
//    }
//
//    func sendNotification(seconds: Double) {
//        let notificationContent = UNMutableNotificationContent()
//
//        notificationContent.title = "알림 테스트"
//        notificationContent.body = "이것은 알림을 테스트 하는 것이다"
//
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
//        let request = UNNotificationRequest(identifier: "testNotification",
//                                            content: notificationContent,
//                                            trigger: trigger)
//
//        userNotificationCenter.add(request) { error in
//            if let error = error {
//                print("Notification Error: ", error)
//            }
//        }
//    }
    
}
