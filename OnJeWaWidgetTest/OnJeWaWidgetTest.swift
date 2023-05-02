//
//  OnJeWaWidgetTest.swift
//  OnJeWaWidgetTest
//
//  Created by Kim SungHun on 2023/04/26.
//

import WidgetKit
import SwiftUI

extension UserDefaults {
    static var shared: UserDefaults {
        let appGroupId = "group.ungchun.onjewa"
        return UserDefaults(suiteName: appGroupId)!
    }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        //        let testValue = UserDefaults.shared.string(forKey: "testKey")!
        //        let testValue = UserDefaults.shared.integer(forKey: "testKeyInt")
        return SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        //        let testValue = UserDefaults.shared.string(forKey: "testKey")!
        //        let testValue = UserDefaults.shared.integer(forKey: "testKeyInt")
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let currentDate = Date()
        
        for minOffset in 0...10 {
            var testValue = UserDefaults.shared.float(forKey: "testKeyFloat")
            testValue += 0.01
            UserDefaults.shared.set(testValue, forKey: "testKeyFloat")
            let entryDate = Calendar.current.date(byAdding: .minute, value: minOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }
        
        //MARK: ViewContoller
        //        for minOffset in 0...10 {
        //            var testValue = UserDefaults.shared.integer(forKey: "testKeyInt")
        //            testValue += 1
        //            UserDefaults.shared.set(testValue, forKey: "testKeyInt")
        //            let entryDate = Calendar.current.date(byAdding: .minute, value: minOffset, to: currentDate)!
        //            let entry = SimpleEntry(date: entryDate)
        //            entries.append(entry)
        //        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
//    let testValue = UserDefaults.shared.integer(forKey: "testKeyInt")
    let testValue = UserDefaults.shared.float(forKey: "testKeyFloat")
}

struct OnJeWaWidgetTestEntryView : View {
    var entry: Provider.Entry
//    @State private var progress: Float = 0.2 // 20%
    
    var body: some View {
        //        Text(entry.date, style: .timer)
        //        Text("\(entry.testValue)")
        //        Text("\(UserDefaults.shared.integer(forKey: "testKeyInt"))")
        
        VStack {
            ProgressView(value: UserDefaults.shared.float(forKey: "testKeyFloat"))
                .progressViewStyle(LinearProgressViewStyle(tint: .yellow))
                .frame(height: 50)
                .padding()
        }
        
    }
}

struct OnJeWaWidgetTest: Widget {
    let kind: String = "OnJeWaWidgetTest"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            OnJeWaWidgetTestEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}
