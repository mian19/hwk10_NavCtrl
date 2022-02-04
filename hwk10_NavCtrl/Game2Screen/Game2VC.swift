//
//  Game2VC.swift
//  hwk10_NavCtrl
//
//  Created by Kyzu on 30.01.22.
//

import UIKit

class Game2VC: UIViewController {
    private var circle: UIView!
    private let radiusOfCircle: CGFloat = 80

    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        customView.backgroundColor = UIColor(red: 0.4275, green: 0.7216, blue: 0.7294, alpha: 1.0)
        view = customView
        
        circle = UIView()
        circle.backgroundColor = .red
        circle.frame = CGRect(x: view.bounds.midX - radiusOfCircle, y: view.bounds.midY - radiusOfCircle, width: radiusOfCircle * 2, height: radiusOfCircle * 2)
        circle.layer.cornerRadius = radiusOfCircle
        circle.layer.masksToBounds = true
        view.addSubview(circle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workWithNavCtrl()
        workWithRecognizers()
        NotificationCenter.default.addObserver(self, selector: #selector(rotatedPhone), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc private func rotatedPhone() {
        if UIDevice.current.orientation.isPortrait || UIDevice.current.orientation.isLandscape {
            circle.frame = CGRect(x: view.bounds.midX - radiusOfCircle, y: view.bounds.midY - radiusOfCircle, width: radiusOfCircle * 2, height: radiusOfCircle * 2)
        }
    }
    
    private func workWithNavCtrl() {
        self.navigationController?.navigationBar.backgroundColor = .systemBrown
        title = "Game 2"
    }
    
    private func workWithRecognizers() {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(circleToLeft))
        leftSwipe.direction = .left
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(circleToRight))
        rightSwipe.direction = .right
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(circleToUp))
        upSwipe.direction = .up
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(circleToDown))
        downSwipe.direction = .down
        
        circle.addGestureRecognizer(leftSwipe)
        circle.addGestureRecognizer(rightSwipe)
        circle.addGestureRecognizer(upSwipe)
        circle.addGestureRecognizer(downSwipe)
    }
    
    @objc private func circleToLeft(sender: UISwipeGestureRecognizer) {
        moveCircle(direction: sender.direction)
    }
    
    @objc private func circleToRight(sender: UISwipeGestureRecognizer) {
        moveCircle(direction: sender.direction)
    }
    
    @objc private func circleToUp(sender: UISwipeGestureRecognizer) {
        moveCircle(direction: sender.direction)
    }
    
    @objc private func circleToDown(sender: UISwipeGestureRecognizer) {
        moveCircle(direction: sender.direction)
    }
    
    private func moveCircle(direction: UISwipeGestureRecognizer.Direction, movingStep: CGFloat = 40 ) {
        let minYforCircle = (self.navigationController?.navigationBar.frame.maxY)!
        var setX: CGFloat! = circle.frame.origin.x
        var setY: CGFloat! = circle.frame.origin.y
        
        //1 - right, 2 - left, 4 - up, 8 - down
        switch direction.rawValue {
        case 1:
            setX += movingStep
        case 2:
            setX -= movingStep
        case 4:
            setY -= movingStep
        case 8:
            setY += movingStep
        default: break
        }
        
        if setX <= view.safeAreaLayoutGuide.layoutFrame.minX  {
            setX = view.bounds.minX
        } else if setX >= view.safeAreaLayoutGuide.layoutFrame.maxX - radiusOfCircle * 2  {
            setX = view.safeAreaLayoutGuide.layoutFrame.maxX - radiusOfCircle * 2
        }
        
        if setY <= minYforCircle  {
            setY = minYforCircle
        } else if setY >= view.safeAreaLayoutGuide.layoutFrame.maxY - radiusOfCircle * 2 {
            setY = view.safeAreaLayoutGuide.layoutFrame.maxY - radiusOfCircle * 2
        }
        
        circle.frame = CGRect(x: setX , y: setY , width: radiusOfCircle * 2, height: radiusOfCircle * 2)
    }
    

}
