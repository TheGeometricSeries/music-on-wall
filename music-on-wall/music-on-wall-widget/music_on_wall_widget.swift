//
//  music_on_wall_widget.swift
//  music-on-wall-widget
//
//  Created by 이동혁 on 8/25/25.
//

import WidgetKit
import SwiftUI

// 위젯에 들어갈 데이터 구조
struct SimpleEntry: TimelineEntry {
    let date: Date
}

// 위젯 데이터 공급자
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        let entry = SimpleEntry(date: Date())
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

//위젯 본체
struct music_on_wall_widget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "music-on-wall-widget", provider: Provider()) { entry in
            VStack {
                Button("▶ / ⏸") {
                    Task {
                        try? await PlayPauseIntent().perform()
                    }
                }
            }
        }
        .configurationDisplayName("Music Remote")
        .description("Quick play/pause for Apple Music.")
    }
}
