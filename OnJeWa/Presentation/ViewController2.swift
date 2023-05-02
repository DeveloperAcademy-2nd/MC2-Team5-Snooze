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

import OnJeWaCore
import Photos
import WidgetKit

class ViewController2: BaseViewController, CLLocationManagerDelegate {
    
    let startButton = UIButton()
    
    let progressView = UIProgressView()
    
    @objc
    func setBtnTap() {
        UserDefaults.shared.set(0.2, forKey: "testKeyFloat")
        print("setBtnTap")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var testValue = UserDefaults.shared.integer(forKey: "testKeyInt")
        
        view.backgroundColor = .blue
        startButton.backgroundColor = .black
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        startButton.addTarget(self, action: #selector(setBtnTap), for: .touchUpInside)
        
        [startButton, progressView].forEach {
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        print("?? \(UserDefaults.shared.float(forKey: "testKeyFloat"))")
        progressView.progress = UserDefaults.shared.float(forKey: "testKeyFloat") // 20%
    }
    
    
//            WidgetCenter.shared.reloadAllTimelines()
    
}
