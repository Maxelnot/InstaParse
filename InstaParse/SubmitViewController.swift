//
//  SubmitViewController.swift
//  InstaParse
//
//  Created by Cong Tam Quang Hoang on 14/03/17.
//  Copyright © 2017 Cong Tam Quang Hoang. All rights reserved.
//

import UIKit

class SubmitViewController: UIViewController {

    @IBOutlet weak var captionField: UITextView!
    @IBOutlet weak var imageChosen: UIImageView!
    var imageFromPost: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageChosen.image = imageFromPost!
        if let size = imageChosen.image?.size{
            let multiplier = size.width / size.height
            let aspectRatioConstraint = NSLayoutConstraint(item: imageChosen, attribute: .width, relatedBy: .equal, toItem: imageChosen, attribute: .height, multiplier: multiplier, constant: 0)
            imageChosen.addConstraint(aspectRatioConstraint)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButton(_ sender: Any) {
       // imageFromPost = resize(image: imageFromPost!, newSize: CGSize.init())
        if (captionField.text != "Add a Caption"){
            Post.postUserImage(image: imageFromPost, withCaption: captionField.text, withCompletion: { (true, error: Error?) in
            })
            //save caption
        }else{
            //empty caption
            Post.postUserImage(image: imageFromPost, withCaption: " ", withCompletion: { (true, error: Error?) in
            })
        }
        
    }

    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: newSize.width, height: newSize.height))
        resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
