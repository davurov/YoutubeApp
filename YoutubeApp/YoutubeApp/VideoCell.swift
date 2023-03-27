//
//  VideoCell.swift
//  YoutubeApp
//
//  Created by Abduraxmon on 27/03/23.
//

import UIKit

class VideoCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnailVideoImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setCell(_ v:Video) {
        self.video = v
        
        guard video != nil else {
            return
        }
        // set title of the cell
        self.titleLbl.text = video?.title
        // set data Lbl
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLbl.text = df.string(from: video!.published)
        // set thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        //Check thumbnail before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            // set thumbnail imageView
            self.thumbnailVideoImage.image = UIImage(data: cachedData)
            return
        }
        
        // Download thumbnail
        let url = URL(string: self.video!.thumbnail)
        // Get the shared url session object
        let session = URLSession.shared
        // Create a data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil {
                // save data  in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                // check the downloaded data match the video sumbnail
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                //Create image object
                let image = UIImage(data: data!)
                //set the imageView
                DispatchQueue.main.async {
                    self.thumbnailVideoImage.image = image
                }
            }
            
        }
        // start dataTask
        dataTask.resume()
        
    }
    
}
