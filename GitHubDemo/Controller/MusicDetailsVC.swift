//
//  MusicDetailsVC.swift
//  GitHubDemo
//
//  Created by MacHD on 05/09/19.
//  Copyright © 2019 MacHD. All rights reserved.
//

import UIKit
//Import framework to support audio
import AVFoundation
class MusicDetailsVC: UIViewController {
    @IBOutlet weak var txtlblMusicTitle: UILabel!
    @IBOutlet weak var btnPlayMusic: UIButton!
    @IBOutlet weak var btnNextMusic: UIButton!
    @IBOutlet weak var btnPreviousMusic: UIButton!
    @IBOutlet weak var MusicSlider: UISlider!
    @IBOutlet weak var txtlblTotalDuration: UILabel!
    @IBOutlet weak var txtlblPlayedTime: UILabel!
    
    
    var titleofmusic = ""
    var FileName = ""
    var indexnumber = 0
    
    var aarofMusicDci = [[String:String]]()
    //Create object of the player
    var player = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        txtlblMusicTitle.text = titleofmusic
        PlayMusic(FileName:FileName)
        self.title = titleofmusic
     }
    
    override func viewDidDisappear(_ animated: Bool) {
        player.stop()
    }
    @IBAction func btnToPlayMusic(_ sender: UIButton) {
        if sender.isSelected == false{
         sender.setImage(UIImage(named: "pause"), for: UIControl.State.normal)
            PlayMusic(FileName: FileName)
           sender.isSelected = true
        }else{
            player.pause()
           sender.setImage(UIImage(named: "play"), for: UIControl.State.normal)
          sender.isSelected = false
        }
       
    }
    
    @objc func update() {
        MusicSlider.value = Float(player.currentTime)
        txtlblPlayedTime.text = "\(MusicSlider.value)"
    }
    
   
    @IBAction func btnNextMusic(_ sender: Any) {
         print("index number btnNextMusic",indexnumber)
         if indexnumber < aarofMusicDci.count{
              indexnumber = indexnumber + 1
           if indexnumber != aarofMusicDci.count{
         let filename =  (self.aarofMusicDci[indexnumber])["FileName"]!
         txtlblMusicTitle.text =  (self.aarofMusicDci[indexnumber])["MusicName"]!
         PlayMusic(FileName: filename)
            }else{
                
            }
        }
        
    }
    
    @IBAction func btnPreviousMusic(_ sender: Any) {
        
        print("index number btnPreviousMusic",indexnumber)
        if indexnumber > 0{
             indexnumber = indexnumber - 1
           let filename =  (self.aarofMusicDci[indexnumber])["FileName"]!
            txtlblMusicTitle.text =  (self.aarofMusicDci[indexnumber])["MusicName"]!
            PlayMusic(FileName: filename)
        }
    }
    
    
    @IBAction func SkipMusic(_ sender: AnyObject) {
     player.currentTime = TimeInterval(MusicSlider.value)
     txtlblPlayedTime.text = "\(MusicSlider.value)"
    }
  
    //Play Music When Came to this screen
    func PlayMusic(FileName:String)  {
        btnPlayMusic.setImage(UIImage(named: "pause"), for: UIControl.State.normal)
        btnPlayMusic.isSelected = true
        
        //find the path of the music
        // accessing file inside project
        let path = Bundle.main.path(forResource:FileName, ofType: "mp3")
        let url = URL(string: path!)!
        do{
            try player = AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
            MusicSlider.maximumValue = Float(player.duration)
            txtlblTotalDuration.text = "\(player.duration)"
            txtlblPlayedTime.text = "\(player.duration)"
            
        }catch{
            print("error while playing the music")//pause play
            // update of progress
            
        }
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
}
