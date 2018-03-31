//
//  Record2VC.swift
//  Dream Recorder
//
//  Created by Belinda Mo on 10/17/17.
//  Copyright © 2017 Belinda Mo. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class Record2VC: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var timeField: UILabel!
    var audioPlayer: AVAudioPlayer!
    var transcription: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        requestSpeechAuth()
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        audioPlayer.stop()
    }
    
    func requestSpeechAuth() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                    do {
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        self.audioPlayer.delegate = self
                        sound.play()
                    } catch {
                        print("Error!")
                    }
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request) { (result, error) in
                        if let error = error {
                            print("There was an error: \(error)")
                        } else {
                            self.transcription = result?.bestTranscription.formattedString
                        }
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "record3" {
            if let destination = segue.destination as? Record3VC {
                if let content = sender as? String {
                    destination.content = content
                }
            }
        }
    }
    
    @IBAction func stopPressed(_ sender: Any) {
        performSegue(withIdentifier: "record3", sender: transcription)
    }
    

}
