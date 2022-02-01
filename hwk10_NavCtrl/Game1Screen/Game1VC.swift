//
//  Game1VC.swift
//  hwk10_NavCtrl
//
//  Created by Kyzu on 30.01.22.
//

import UIKit

class Game1VC: UIViewController {
    private var circle: UIView!
    
    override func loadView() {
        let custonView = UIView(frame: UIScreen.main.bounds)
        view = custonView
        view.backgroundColor = UIColor(red: 0.7373, green: 0.6745, blue: 0, alpha: 1.0)
        circle = UIView()
        circle.backgroundColor = .red
        
        view.addSubview(circle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Game1"
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.4, green: 0.3176, blue: 0, alpha: 1.0)
        
        let tapRecognizerVC = UITapGestureRecognizer(target: self, action: #selector(tapVC))
        let tapRecognizerCircle = UITapGestureRecognizer(target: self, action: #selector(tapCircle))
        view.addGestureRecognizer(tapRecognizerVC)
        circle.addGestureRecognizer(tapRecognizerCircle)
    }
    
    override func viewWillLayoutSubviews() {
        circle.frame = CGRect(x: view.bounds.midX - 25, y: view.bounds.midY - 25, width: 50, height: 50)
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.layer.masksToBounds = true
    }
    
    @objc private func tapVC(sender: UITapGestureRecognizer) {
        if circle.isHidden {
            let currentTap = sender.location(in: view)
            putCircleOnView(point: currentTap)
        }
    }
    
    @objc private func tapCircle(sender: UITapGestureRecognizer) {
        circle.isHidden.toggle()
    }
    
    private func putCircleOnView(point: CGPoint) {
        let radiusOfCircle = circle.frame.width / 2
        let minYforCircle = (self.navigationController?.navigationBar.frame.maxY)!
        var setX: CGFloat!
        var setY: CGFloat!
        
        if point.x <= view.safeAreaLayoutGuide.layoutFrame.minX + radiusOfCircle {
            setX = view.bounds.minX + radiusOfCircle
        } else if point.x >= view.safeAreaLayoutGuide.layoutFrame.maxX - radiusOfCircle {
            setX = view.safeAreaLayoutGuide.layoutFrame.maxX - radiusOfCircle
        } else {
            setX = point.x
        }
        
        if point.y <= minYforCircle + radiusOfCircle {
            setY = minYforCircle + radiusOfCircle
        } else if point.y >= view.safeAreaLayoutGuide.layoutFrame.maxY - radiusOfCircle {
            setY = view.safeAreaLayoutGuide.layoutFrame.maxY - radiusOfCircle
        } else {
            setY = point.y
        }
        
        circle.frame = CGRect(x: setX - radiusOfCircle, y: setY - radiusOfCircle, width: 50, height: 50 )
        circle.isHidden = false
    }
    
}
