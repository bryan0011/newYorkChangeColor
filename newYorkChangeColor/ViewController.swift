//
//  ViewController.swift
//  newYorkChangeColor
//
//  Created by Bryan Kuo on 2021/6/23.
//

import UIKit

class ViewController: UIViewController {

//    定義每一個元件的名字
//    定義兩個漸層色的View
    @IBOutlet weak var cityGradientView: UIView!
    @IBOutlet weak var NYGradientView: UIView!
    
//    定義兩個圖片的ImageView
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var NYImageView: UIImageView!
    
//    定義RGBA&漸層的Slider
    @IBOutlet weak var cityRedSlider: UISlider!
    @IBOutlet weak var cityGreenSlider: UISlider!
    @IBOutlet weak var cityBlueSlider: UISlider!
    @IBOutlet weak var cityAlphaSlider: UISlider!
    @IBOutlet weak var cityGradientSlider: UISlider!
    @IBOutlet weak var NYRedSlider: UISlider!
    @IBOutlet weak var NYGreenSlider: UISlider!
    @IBOutlet weak var NYBlueSlider: UISlider!
    @IBOutlet weak var NYAlphaSlider: UISlider!
    @IBOutlet weak var NYGradientSlider: UISlider!
    
//    定義重製&隨機按鈕
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var rendomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    上面City圖的背景顏色改變
    @IBAction func cityViewChangeColor(_ sender: Any) {
        
        cityImageView.backgroundColor=UIColor(
            red: CGFloat(cityRedSlider.value),
            green: CGFloat(cityGreenSlider.value),
            blue: CGFloat(cityBlueSlider.value),
            alpha: CGFloat(cityAlphaSlider.value))
        
    }

//    下面NewYork圖的背景顏色改變
    @IBAction func NYChangeColor(_ sender: Any) {
        NYImageView.backgroundColor=UIColor(
            red: CGFloat(NYRedSlider.value),
            green: CGFloat(NYGreenSlider.value),
            blue: CGFloat(NYBlueSlider.value),
            alpha: CGFloat(NYAlphaSlider.value))
    }
    
//    Reset 所有顏色滑桿歸零並背景色也歸零
    @IBAction func resetButtonPressed(_ sender: Any) {
        
//        所有顏色滑桿歸零
        cityRedSlider.value=0
        cityGreenSlider.value=0
        cityBlueSlider.value=0
        cityAlphaSlider.value=0
        cityGradientSlider.value=0
        NYRedSlider.value=0
        NYGreenSlider.value=0
        NYBlueSlider.value=0
        NYAlphaSlider.value=0
        NYGradientSlider.value=0
        
        
//        背景色歸零
        cityImageView.backgroundColor=UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        NYImageView.backgroundColor=UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
//        移除漸層色
        cityGradientView.layer.sublayers?.removeAll()
        NYGradientView.layer.sublayers?.removeAll()
    
    
    }
    
//    產生隨機顏色
    @IBAction func imageRandomColor(_ sender: Any) {
        
//        產生r1~r5 & a 的亂數值
        let r1 = Double.random(in: 0...1)
        let r2 = Double.random(in: 0...1)
        let r3 = Double.random(in: 0...1)
        let r4 = Double.random(in: 0...1)
        let r5 = Double.random(in: 0...1)
        let a = Double.random(in: 0...1)
        
//        城市的背景色設計為r1~r3所產生的顏色值
        cityImageView.backgroundColor=UIColor(
            red: CGFloat(r1),
            green: CGFloat(r2),
            blue: CGFloat(r3),
            alpha: CGFloat(a))
        
//        Slider 的位置等於r1~r3所產生的數值
        cityRedSlider.value=Float(r1)
        cityGreenSlider.value=Float(r2)
        cityBlueSlider.value=Float(r3)
        cityAlphaSlider.value=Float(a)
        
//        字體的背景色設計為r3~r5所產生的顏色值
        NYImageView.backgroundColor=UIColor(
            red: CGFloat(r3),
            green: CGFloat(r4),
            blue: CGFloat(r5),
            alpha: CGFloat(a))
        
//        Slider 的位置等於r3~r5所產生的數值
        NYRedSlider.value=Float(r3)
        NYGreenSlider.value=Float(r4)
        NYBlueSlider.value=Float(r5)
        NYAlphaSlider.value=Float(a)
        
    }
    
//    city背景產生漸層色
    @IBAction func cityGradientColor(_ sender: Any) {
//     定義漸層Slider的數值在0~1裡劃分為10000等份,10000數值可以調整,數值越大建層色滑動越順
        let locationCity = round(10000*cityGradientSlider.value)/10000
//    定義產生漸層Layer
        let cityGradientLayer = CAGradientLayer()
//        layer的尺寸大小等於city背景尺寸大小
        cityGradientLayer.frame=cityImageView.bounds
//        定義漸層色是橘色跟藍色組合
        cityGradientLayer.colors=[UIColor.orange.cgColor, UIColor.blue.cgColor]
//        漸層的位置為0.0~1.0
        cityGradientLayer.locations=[0.0, NSNumber(value: locationCity)]
//        將漸層是的layer加在漸層View上面
        cityGradientView.layer.addSublayer(cityGradientLayer)
        
    }
    
//    NewYork背景產生漸層色
    @IBAction func NYGradientColor(_ sender: Any) {
        let locationNY = round(10000*NYGradientSlider.value)/10000
        let NYGradientLayer = CAGradientLayer()
        NYGradientLayer.frame=NYGradientView.bounds
        NYGradientLayer.colors=[UIColor.orange.cgColor,UIColor.purple.cgColor]
        NYGradientLayer.locations=[0.0, NSNumber(value: locationNY)]
        NYGradientView.layer.addSublayer(NYGradientLayer)
        
        
    }
    
}

