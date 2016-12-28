//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 海野恵凜那 on 2016/12/22.
//  Copyright © 2016年 erina.umino. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {
    
    var i:Int = 1
    var tapCount:Int = 0
    var timer: Timer? = nil
    
    @IBOutlet weak var showw: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var goo: UIButton!
    @IBOutlet weak var backk: UIButton!

    @IBAction func next(_ sender: Any) {
        timer?.invalidate()
        timer = nil
    }
    
    @IBAction func go(_ sender: Any){
        if self.i < 7{
            self.i += 1
            let img = UIImage(named:"image\(i)")
            imageView.image = img
        }else {
            self.i = 1
            let img = UIImage(named:"image\(i)")
            imageView.image = img
        }
    }
    
    @IBAction func back(_ sender: Any) {
        if self.i > 1{
            self.i -= 1
            let img = UIImage(named:"image\(i)")
            imageView.image = img
        }else {
            self.i = 7
            let img = UIImage(named:"image\(i)")
            imageView.image = img
        }

    }
    
    @IBAction func show(_ sender: Any) {
        tapCount += 1
        
        if tapCount%2 == 1 {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.onUpdate(_:)), userInfo: nil, repeats: true)
            goo.isEnabled = false
            backk.isEnabled = false
            showw.setTitle("停止", for: UIControlState.normal)
        } else {
            timer?.invalidate()
            timer = nil
            goo.isEnabled = true
            backk.isEnabled = true
            showw.setTitle("再生", for: UIControlState.normal)
        
        }
       
    }
    
    func onUpdate(_ timer : Timer){
        if self.i < 7{
            self.i += 1
            let img = UIImage(named:"image\(i)")
            imageView.image = img
        }else {
            self.i = 1
            let img = UIImage(named:"image\(i)")
            imageView.image = img
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
                    timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.onUpdate(_:)), userInfo: nil, repeats: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondViewController" {
        let secondViewController = segue.destination as! SecondViewController
        secondViewController.j = i
        }
}
}
