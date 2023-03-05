//
//  ViewController.swift
//  Marathon -- Task 2
//
//  Created by Magomet Bekov on 05.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var firstButton: UIButton = {
        var first = UIButton.Configuration.filled()
        first.image = UIImage(systemName: "arrow.right.circle.fill")
        first.imagePlacement = .trailing
        first.title = "First Button"
        first.imagePadding = 8
        first.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 14,
            bottom: 10,
            trailing: 14
        )
        
        let button = UIButton(configuration: first)
        return button
    }()

    private lazy var secondButton: UIButton = {
        var second = UIButton.Configuration.filled()
        second.image = UIImage(systemName: "arrow.right.circle.fill")
        second.imagePlacement = .trailing
        second.title = "Second Medium Button"
        second.imagePadding = 8
        second.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 14,
            bottom: 10,
            trailing: 14
        )
        
        let button = UIButton(configuration: second)
        return button
    }()


    private lazy var thirdButton: UIButton = {
        var third = UIButton.Configuration.filled()
        third.image = UIImage(systemName: "arrow.right.circle.fill")
        third.imagePlacement = .trailing
        third.title = "Third"
        third.imagePadding = 8
        third.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 14,
            bottom: 10,
            trailing: 14
        )
        
        let button = UIButton(configuration: third)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupBehavior()
    }
    
    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
    }

    private func setupConstraints() {
        firstButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.top.equalToSuperview().inset(70)
            make.centerX.equalToSuperview()
        }

        secondButton.snp.makeConstraints { make in
            make.top.equalTo(firstButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
        }

        thirdButton.snp.makeConstraints { make in
            make.top.equalTo(secondButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
        }
    }

    private func setupBehavior() {
        firstButton.startAnimatingPressActions()
        secondButton.startAnimatingPressActions()
        thirdButton.startAnimatingPressActions()
        thirdButton.addTarget(buttonDidTap, action: #selector(buttonDidTap), for: .touchUpInside)
    }

    @objc
    private func buttonDidTap() {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        present(vc,animated: true)
    }
}

extension UIButton {
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }

    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }

    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }

    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
                        button.transform = transform
            }, completion: nil)
    }
}
