//
//  music_on_wallApp.swift
//  music-on-wall
//
//  Created by 이동혁 on 8/24/25.
//

import SwiftUI

@main
struct MusicWidgetApp: App {
    var body: some Scene {
        MenuBarExtra("Music Control", systemImage: "music.note") {
            Button("▶︎ / ⏸") {
                runAppleScript("tell application \"Music\" to playpause")
            }
            Button("⏭ 다음 곡") {
                runAppleScript("tell application \"Music\" to next track")
            }
            Button("⏮ 이전 곡") {
                runAppleScript("tell application \"Music\" to previous track")
            }
        }
    }

    func runAppleScript(_ source: String) {
        if let script = NSAppleScript(source: source) {
            var error: NSDictionary?
            script.executeAndReturnError(&error)
        }
    }
}
