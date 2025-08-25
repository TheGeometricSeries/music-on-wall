//
//  PlayPauseIntent.swift
//  music-on-wall
//
//  Created by 이동혁 on 8/25/25.
//

import AppIntents
import MusicKit

struct  PlayPauseIntent: AppIntent {
    static var title: LocalizedStringResource = "Play/Pause"
    
    func perform() async throws -> some IntentResult {
        //애플 뮤직 제어(MusicKit 이용)
        //재생 및 중지
        let togglePlayPause = """
        tell application "Music"
            if player state is playing then
                pause
            else
                play
            end if
        end tell    
        """
        //다음 노래
        let nextTrack = """
        tell application "Music"
            previous track
        end tell
        """
        //이전 노래
        let previousTrack = """
        tell application "Music"
            previous track
        end tell
        """
        
        if let script = NSAppleScript(source: togglePlayPause) {
            var error: NSDictionary?
            script.executeAndReturnError(&error)
            if let error = error {
                print("Error executing script: \(error)")
            }
        }
        return .result()
    }
}
