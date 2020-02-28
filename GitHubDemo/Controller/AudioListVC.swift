//
//  AudioListVC.swift
//  GitHubDemo
//
//  Created by MacHD on 05/09/19.
//  Copyright © 2019 MacHD. All rights reserved.
//

import UIKit

class AudioListVC: UITableViewController {

    var aarofMusicDci = [[String:String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StoreMusicToArr()
       tableView.separatorStyle = .none
    }

   // MARK: - Table view data source
   //return no of section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //return nomuber of rows in sections
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return aarofMusicDci.count
    }
   
    //load the data with the cell n retur the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AudioListCell", for: indexPath) as! AudioListCell
        GLobal.CornerOfImageView(ImageView:cell.imgMusicSong)
        let obj = self.aarofMusicDci[indexPath.row]
        cell.txtlblSongTitle.text = obj["MusicName"]
        cell.selectionStyle = .none
        return cell
    }
//to redirect to the music player screen
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let MusicDetailsVCobj = storyboard?.instantiateViewController(withIdentifier: "MusicDetailsVC") as! MusicDetailsVC
        MusicDetailsVCobj.titleofmusic = (self.aarofMusicDci[indexPath.row])["MusicName"]!
        MusicDetailsVCobj.FileName =   (self.aarofMusicDci[indexPath.row])["FileName"]!
        MusicDetailsVCobj.indexnumber = indexPath.row
        MusicDetailsVCobj.aarofMusicDci = self.aarofMusicDci
        
        print("file name is",  MusicDetailsVCobj.FileName)
        self.navigationController?.pushViewController(MusicDetailsVCobj, animated: true)
    }
}
extension AudioListVC{
    func StoreMusicToArr(){
        let dicobj1 = ["FileName":"music1","MusicName":"Gregoire Lourme-Spirit of Africa"]
        aarofMusicDci.append(dicobj1)
        let dicobj2 = ["FileName":"music2","MusicName":"T-Trider-African Dance"]
        aarofMusicDci.append(dicobj2)
        let dicobj3 = ["FileName":"music3","MusicName":"Akashic Records-African Mbira with Percussion"]
         aarofMusicDci.append(dicobj3)
        let dicobj4 = ["FileName":"music4","MusicName":"T-Trider-African Journey _original version_"]
        aarofMusicDci.append(dicobj4)
        let dicobj5 = ["FileName":"music5","MusicName":"Youssouf Karembe-Honjaro"]
        aarofMusicDci.append(dicobj5)
        let dicobj6 = ["FileName":"music6","MusicName":"THEO ARNISOUND-Zoo Discovery"]
        aarofMusicDci.append(dicobj6)
        let dicobj7 = ["FileName":"music7","MusicName":"Gregoire Lourme-Africa The Cradle of Life _Epic Version"]
        aarofMusicDci.append(dicobj7)
        
        let dicobj8 = ["FileName":"music8","MusicName":"Petite Viking-MAMA AFRICA"]
        aarofMusicDci.append(dicobj8)
        let dicobj9 = ["FileName":"music9","MusicName":"alessandro ricci-africa"]
        aarofMusicDci.append(dicobj9)
        let dicobj10 = ["FileName":"music10","MusicName":"jean-pierre.saussac-Savane"]
        aarofMusicDci.append(dicobj10)
        let dicobj11 = ["FileName":"music11","MusicName":"Steve Raphael-Africa _African Tribal Folk_"]
        aarofMusicDci.append(dicobj11)
        
        let dicobj12 = ["FileName":"music12","MusicName":"Whiteyes-Coups de soleil"]
        aarofMusicDci.append(dicobj12)
        
        let dicobj13 = ["FileName":"music13","MusicName":"Alexiaction-African Safari"]
        aarofMusicDci.append(dicobj13)
        let dicobj14 = ["FileName":"music14","MusicName":"Square_a_Saw_-_Wake_Up"]
        aarofMusicDci.append(dicobj14)
        let dicobj15 = ["FileName":"music15","MusicName":"Full_Song_-_Shiva_and_Kali_Dance"]
        aarofMusicDci.append(dicobj15)
        let dicobj16 = ["FileName":"music16","MusicName":"Honjaro (2009)"]
        aarofMusicDci.append(dicobj16)
        let dicobj17 = ["FileName":"music17","MusicName":"MAMA AFRICA (2017)"]
        aarofMusicDci.append(dicobj17)
        let dicobj18 = ["FileName":"music18","MusicName":"Petite_Viking_-_MAMA_AFRICA"]
        aarofMusicDci.append(dicobj18)
     }
}
