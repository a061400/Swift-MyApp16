//
//  ViewController.swift
//  MyApp16
//
//  Created by 謝尚霖 on 2017/9/26.
//  Copyright © 2017年 謝尚霖. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {
    
private var q1 = DispatchQueue(label: "q1", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent)
    
    @IBAction func dotest2(_ sender: Any) {
        let url = URL(string: "http://cdna.images.djcity.com/2017/magpark_hoodie_2000.jpg")
        
        
        q1.async {
        if let data = try? Data(contentsOf: url!){
            DispatchQueue.main.async {
                self.imgv.image = UIImage(data: data)
            }
            }
            
        }
        
    }
    
    @IBAction func dotest1(_ sender: Any) {
        let url = URL(string: "http://desk.fd.zol-img.com.cn/t_s960x600c5/g5/M00/02/04/ChMkJ1bKyEyIMaKUAAhskHwWGqUAALIAAM2KsIACGyo249.jpg")
        
        let config = URLSessionConfiguration.background(withIdentifier: "myid")
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        
        
        
        let task = session.downloadTask(with: url!)
        task.resume()
        
        
        if let data = try? Data(contentsOf: url!){
            DispatchQueue.main.async {
                self.imgv.image = UIImage(data: data)
            }
            
        }
    }
    
    
    @IBOutlet weak var imgv: UIImageView!
    
    
    
    @IBOutlet weak var pros: UIProgressView!
    
    
    
    
    
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("finish download")
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        print("\(bytesWritten):\(totalBytesWritten):\(totalBytesExpectedToWrite)")
        
        
        DispatchQueue.main.async {
             self.pros.progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        }
       
        
    }
    
    
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    


}

