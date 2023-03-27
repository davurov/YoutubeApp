//
//  VideoDetailVC.swift
//  YoutubeApp
//
//  Created by Abduraxmon on 27/03/23.
//

import UIKit
import WebKit

class VideoDetailVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // clear the field
        titleLbl.text = ""
        dateLbl.text = ""
        textView.text = ""
        
        guard video != nil else {
            return
        }
        
        // Create the embed url
        let embedUrlString = K.youtubeEmbed + video!.videoId
        // Load it into webView
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        // set the title
        titleLbl.text = video!.title
        // set the data
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLbl.text = df.string(from: video!.published)
        // set the descriptin
        textView.text = video!.description
        
    }

}
