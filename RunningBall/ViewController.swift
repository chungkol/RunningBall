//
//  ViewController.swift
//  RunningBall
//
//  Created by Chung on 8/26/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ball = UIImageView()
    var radians = CGFloat()
    var ballRadius = CGFloat()
    var isEnd: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        _ = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(rollBall), userInfo: nil, repeats: true)
    }
    
    func addBall(){
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadius = 32.0
        ball.center = CGPointMake(ballRadius, mainViewSize.height/2)
        self.view.addSubview(ball)
    }
    
    func rollBall(){
        let deltaAngle: CGFloat = 0.1
        radians = radians + deltaAngle
        let positionBall = self.ball.center.x
        if !isEnd {
            ball.transform = CGAffineTransformMakeRotation(radians)
            ball.center = CGPointMake(positionBall + ballRadius * deltaAngle, ball.center.y)
        }else{
            ball.transform = CGAffineTransformMakeRotation(-radians)
            ball.center = CGPointMake(ball.center.x - ballRadius * deltaAngle, ball.center.y)
        }
        if Int(positionBall) >= Int(self.view.bounds.width - (self.ball.bounds.width / 2)) {
            isEnd = true
            print("trung nhau \(Int(self.view.bounds.width))")
        }
        if Int(positionBall) <= 15 {
            isEnd = false
           
        }
        
    }
}

