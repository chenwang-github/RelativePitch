//
//  songListController.swift
//  RelativePitch
//
//  Created by Chen Wang on 2/25/19.
//  Copyright © 2019 utopia incubator. All rights reserved.
//ssss

import UIKit

class SongListController: UITableViewController {
    
    let cellIdentifier = "SongCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = customRed
        self.tableView.register(SongCell.self, forCellReuseIdentifier: cellIdentifier)
        self.tableView.separatorStyle = .none
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for (name,lock) in songList[indexPath.row]{
            if lock{
                
            }else{
                let dest = PlaySongController()
                dest.prepareController(level: 15)
                print("why not pushed?")
                self.navigationController?.pushViewController(dest, animated: true)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SongCell
        for (name,lock) in songList[indexPath.row]{
            cell.customSetUp(name:name,lock: lock)
        }
        return cell
    }
    

}
