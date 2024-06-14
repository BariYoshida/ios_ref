//
//  UIImage+Extension.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Foundation
import UIKit

extension UIImage {

    func resized(_ size: CGSize) -> UIImage? {
        return UIGraphicsImageRenderer(size: size, format: imageRendererFormat)
            .image { _ in
                draw(in: CGRect(origin: .zero, size: size))
            }
    }

    func checkAspectRatio() -> Bool {
        let minWidthRatio: CGFloat = 2.0 / 5.0
        let maxWidthRatio: CGFloat = 5.0 / 2.0
        
        let aspectRatio = size.width / size.height
        
        return aspectRatio >= minWidthRatio && aspectRatio <= maxWidthRatio
    }
    
    func compressImage() -> Data? {
        let targetSizeInBytes: Int = 150 * 1_024 // 150KB
        var compressionQuality: CGFloat = 1.0
        
        var imageData = jpegData(compressionQuality: compressionQuality)
        
        while let data = imageData, data.count > targetSizeInBytes, compressionQuality > 0.0 {
            compressionQuality -= 0.1
            imageData = jpegData(compressionQuality: compressionQuality)
        }
        
        guard let finalData = imageData, finalData.count <= targetSizeInBytes else {
            return nil
        }
        
        return finalData
    }
}
