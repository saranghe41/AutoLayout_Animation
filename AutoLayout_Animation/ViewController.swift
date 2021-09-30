//
//  ViewController.swift
//  AutoLayout_Animation
//
//  Created by 김지은 on 2021/09/30.
//

import UIKit

class ViewController: UIViewController {
    
    /*
    var topXAnch = 300
    
    var AnimationBtn: UIButton = {
        let AMbtn = UIButton()
        AMbtn.backgroundColor = .white
        AMbtn.translatesAutoresizingMaskIntoConstraints = false
        AMbtn.layer.cornerRadius = 10
        AMbtn.clipsToBounds = true
        AMbtn.tintColor = .black
        AMbtn.titleLabel?.text = "위로 올리기"
        return AMbtn
    }()
    
    var AnimationView: UIView = {
        let AMview = UIView()
        AMview.backgroundColor = .systemPink
        AMview.translatesAutoresizingMaskIntoConstraints = false
        AMview.layer.cornerRadius = 10
        AMview.clipsToBounds = true
        return AMview
    }()
     */
    
    var someViewBottomConstraint: NSLayoutConstraint?
    
    override func loadView() {
        super.loadView()
        print("ViewController - loadView()")
        
        self.view.backgroundColor = UIColor(named: "color_myYellow")
        
        // moveView 생성
        let someView = UIView()
        someView.backgroundColor = UIColor(named: "color_myBlue")
        someView.translatesAutoresizingMaskIntoConstraints = false
        someView.layer.cornerRadius = 8
        
        self.view.addSubview(someView)
        NSLayoutConstraint.activate([
            someView.widthAnchor.constraint(equalToConstant: 100),
            someView.heightAnchor.constraint(equalToConstant: 50),
            someView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        //    someView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        someViewBottomConstraint = NSLayoutConstraint(item: someView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)
        someViewBottomConstraint?.isActive = true
        
        
        // moveButton 생성
        let moveViewUpBtn = UIButton(type: .system)
        moveViewUpBtn.translatesAutoresizingMaskIntoConstraints = false
        moveViewUpBtn.backgroundColor = .white
        moveViewUpBtn.layer.cornerRadius = 8
        moveViewUpBtn.setTitle("위로 올리기", for: .normal)
        moveViewUpBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        moveViewUpBtn.setTitleColor(.black, for: .normal)
        moveViewUpBtn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        moveViewUpBtn.addTarget(self, action: #selector(moveViewUp), for: .touchUpInside)
        
        self.view.addSubview(moveViewUpBtn)
        moveViewUpBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        moveViewUpBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
        
    }
    
    @objc fileprivate func moveViewUp() {
        print("ViewController - moveViewUp() called")
        
        someViewBottomConstraint?.constant -= 100
        
        UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: { [weak self] in
            guard let self = self else { return }
            self.view.layoutIfNeeded()
        }).startAnimation()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController - viewDidLoad()")
        
        /*
        self.view.backgroundColor = .systemYellow
        self.view.addSubview(AnimationBtn)
        NSLayoutConstraint.activate([
            AnimationBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            AnimationBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            AnimationBtn.widthAnchor.constraint(equalToConstant: 120),
            AnimationBtn.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        AnimationBtn.addTarget(self, action: #selector(onAnimationBtnClicked(sender:)), for: .touchUpInside)
        
        self.view.addSubview(AnimationView)
        NSLayoutConstraint.activate([
            AnimationView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            AnimationView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: CGFloat(topXAnch)),
            AnimationView.widthAnchor.constraint(equalToConstant: 80),
            AnimationView.heightAnchor.constraint(equalToConstant: 50)
        ])
         */
    }

    /*
    @objc func onAnimationBtnClicked(sender: UIView) {
        if (topXAnch < 0) {
            topXAnch = 300
        }
        else {
            topXAnch -= 50
        }
        
        self.view.addSubview(sender)
        NSLayoutConstraint.activate([
            AnimationView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            AnimationView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: CGFloat(topXAnch)),
            AnimationView.widthAnchor.constraint(equalToConstant: 80),
            AnimationView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
         
    */
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    // makUI
    @available(IOS 15.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .edgesIgnoringSafeArea(.all)
            .previewDisplayName("미리보기")
    }
}
#endif

