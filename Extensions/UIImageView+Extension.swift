//
//  UIImageView+Extension.swift
//  banque-misr-test-project
//
//  Created by Muhammad Khan on 22/3/24.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func load(from url: URL) {
        image = nil
        if let cachedImage = imageCache.object(forKey: NSString(string: url.absoluteString)) {
            self.image = cachedImage
            return
        }
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageCache.setObject(image, forKey: NSString(string: url.absoluteString))
                    self?.image = image
                }
            }
        }
    }
}
