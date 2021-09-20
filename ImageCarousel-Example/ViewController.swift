//
//  ViewController.swift
//  ImageCarousel-Example
//
//  Created by Belal Samy on 20/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    var movies = [Movie(poster: UIImage(named: "poster-movie-1")!),
                   Movie(poster: UIImage(named: "poster-movie-2")!),
                   Movie(poster: UIImage(named: "poster-movie-3")!),
                   Movie(poster: UIImage(named: "poster-movie-4")!),
                   Movie(poster: UIImage(named: "poster-movie-5")!)]

    
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        
        // pager
        pageView.numberOfPages = movies.count
        pageView.currentPage = 0
        
        // collection view
        sliderCollectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        
        
        // timer
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.slideImage), userInfo: nil, repeats: true)
        }
    }

    @objc func slideImage() {

     if counter < movies.count {
         let index = IndexPath.init(item: counter, section: 0)
         self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
         pageView.currentPage = counter
         counter += 1
     } else {
         counter = 0
         let index = IndexPath.init(item: counter, section: 0)
         self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
         pageView.currentPage = counter
         counter = 1
     }
        
    print(counter)
         
     }
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.movie = movies[indexPath.item]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}


