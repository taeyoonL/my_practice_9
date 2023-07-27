//
//  detailViewController.swift
//  my_practice_9
//
//  Created by 이태윤 on 2023/07/15.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var message : String = ""
    
    @IBOutlet var image_view: UIImageView!
    
    var image : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = message
        image_view.image = image
        // Do any additional setup after loading the view.
    }
    
    func get_message (_ message : String) {
        self.message = message
    }
    
    func get_image (_ image : UIImage) {
        self.image = image
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
