//
//  VideoListVC.swift
//  YoutubeApp
//
//  Created by Abduraxmon on 27/03/23.
//

import UIKit

class VideoListVC: UIViewController, ModelDelegate {

    @IBOutlet weak var tableView: UITableView!
    let model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        model.getVideos()
        setUpTableView()
    }
    
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    //MARK: - Model delegate Methods
    func videofetche(_ videos: [Video]) {
        self.videos = videos
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension VideoListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoCell
        let video = videos[indexPath.row]
        cell.setCell(video)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = VideoDetailVC(nibName: "VideoDetailVC", bundle: nil)
        present(vc, animated: true)
        vc.video = videos[indexPath.row]
    }
    
    
}

