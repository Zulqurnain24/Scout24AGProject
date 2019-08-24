//
//  PageIndicatorView.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.


import UIKit

class ImageScrollPageView: UIView {

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.backgroundColor = Palette.white.color
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = true
        return scrollView
    }()
    var colors:[UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow]
    var pageControl : UIPageControl = UIPageControl(frame: CGRect(x: -1/16 * UIScreen.main.bounds.width, y: 1.2/4 * UIScreen.main.bounds.height, width: 1/8 * UIScreen.main.bounds.width, height: 0.1/4 * UIScreen.main.bounds.height))
    var imagesArray = [UIImage]()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImagesInScrollview()
        configurePageControl()
    }
    
    func setImages(imagesArray: [UIImage]) {
        self.imagesArray.append(contentsOf: imagesArray)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImagesInScrollview() {
        for i in 0..<imagesArray.count {
            let imageView = UIImageView()
            let x = self.frame.size.width * CGFloat(i)
            imageView.frame = CGRect(x: x, y: 0, width: self.frame.width, height: self.frame.height)
            imageView.contentMode = .scaleAspectFit
            imageView.image = imagesArray[i]
            
            scrollView.contentSize.width = scrollView.frame.size.width * CGFloat(i + 1)
            scrollView.addSubview(imageView)
        }
        self.addSubview(scrollView)
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = colors.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = Palette.green.color
        self.pageControl.backgroundColor = Palette.clear.color
        self.pageControl.pageIndicatorTintColor = UIColor.black
        self.pageControl.currentPageIndicatorTintColor = UIColor.green
        self.addSubview(pageControl)
        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = abs(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }

}
