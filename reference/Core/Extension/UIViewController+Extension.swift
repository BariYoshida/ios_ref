//
//  UIViewController+Extension.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Foundation
import UIKit

extension UIViewController {

    func isVisible() -> Bool {
        if self.viewIfLoaded?.window != nil {
            return true
        } else {
            return false
        }
    }

    func setNaviBarLeftBackButton() {
        let button = UIButton()
        button.setImage(UIImage(named: ""), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)

        button.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
    }

    func setNaviBarRightCloseButton() {
        let button = UIButton()
        button.setImage(UIImage(named: ""), for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)

        button.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }), for: .touchUpInside)
    }

    func setNaviBarRightAnimationCloseButton() {
        let button = UIButton()
        button.setImage(UIImage(named: ""), for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)

        button.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.transitionAnimation(duration: 0.3)

            UIView.animate(withDuration: 0.1) {
                self.view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            } completion: { _ in
                self.dismiss(animated: false)

                if let presentationController = self.navigationController?.presentationController {
                    presentationController.delegate?.presentationControllerDidDismiss?(presentationController)
                }
            }
        }), for: .touchUpInside)
    }

    func transitionAnimation(duration: CGFloat) {
        let transition = CATransition()
        transition.duration = duration
        transition.type = CATransitionType.fade
        self.view.window?.layer.add(transition, forKey: kCATransition)
    }

    func setNavigationBarLogImage() {
        let image = UIImage(named: "")
        let width = navigationController?.navigationBar.bounds.width ?? view.bounds.width
        let imageView = UIImageView(frame: CGRect(x: width - 138 / 2,
                                                  y: (44 - 24) / 2,
                                                  width: 138,
                                                  height: 24))
        imageView.image = image?.resized(CGSize(width: 138, height: 24))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }

    func showIndicator() {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.center = self.view.center
        activityIndicator.color = .lightGray
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        self.view.bringSubviewToFront(activityIndicator)
    }

    func hideIndicator() {
        self.view.subviews.forEach {
            if $0 is UIActivityIndicatorView {
                $0.removeFromSuperview()
            }
        }
    }


    func presentationControllerDidDismiss() {
        guard let presentationController = self.presentationController else { return }
        presentationController.delegate?.presentationControllerDidDismiss?(presentationController)
    }
    
    func isBottomSafeAreaAvailable() -> Bool {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
            let safeAreaInsets = keyWindow.safeAreaInsets
            return safeAreaInsets.bottom != 0
        } else {
            return false
        }
    }
}
