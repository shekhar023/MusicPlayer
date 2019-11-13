//
//  GenreButtonScreen.swift
//  MusicPlayer
//
//  Created by Shekhar Chaudhary on 09/09/19.
//  Copyright © 2019 Shekhar Chaudhary. All rights reserved.

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func genre1ButttonTapped(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized{
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    
    @IBAction func StopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func NextButtonTApped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre:String){
        
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }    
}
