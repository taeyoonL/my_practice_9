//
//  addViewController.swift
//  my_practice_9
//
//  Created by 이태윤 on 2023/07/15.
//

import UIKit

class addViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var text_field: UITextField!
    @IBOutlet var image_view: UIImageView!
    @IBOutlet var picker_view: UIPickerView!
    
    var images_real = [UIImage?]()
    
    let num = 1
    let height : CGFloat = 100
    var text : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker_view.delegate = self
        for i in 0..<3 {
            let Img = UIImage(named: images[i])
            images_real.append(Img)
        }
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return num
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return height
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let img = UIImageView(image: images_real[row])
        img.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return img
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        image_view.image = images_real[row]
        self.text = images[row]
    }
    
    @IBAction func add_button(_ sender: UIButton) {
        items.append(text_field.text!)
        images.append(self.text!)
        text_field.text = ""
        _ = navigationController?.popViewController(animated: true)
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
