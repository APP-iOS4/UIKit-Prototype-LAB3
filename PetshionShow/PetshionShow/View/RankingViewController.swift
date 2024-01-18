//
//  RankingViewController.swift
//  PetshionShow
//
//  Created by Kang on 1/17/24.
//

import UIKit

class RankingViewController: BaseViewController {
    
    lazy var resizedImage1 = UIImage(named: "otContents")!.resized(to: CGSize(width: view.frame.width, height: 1000))
    lazy var resizedImage2 = UIImage(named: "acContents")!.resized(to: CGSize(width: view.frame.width, height: 1000))
    lazy var resizedImage3 = UIImage(named: "yongpumContents")!.resized(to: CGSize(width: view.frame.width, height: 1000))
    
    // 메인 레이블
    let labelMain: UILabel = {
        let label = UILabel()
        label.text = "랭 킹"
        // label.backgroundColor = .systemGray5
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 세그먼트
    let segment: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "옷", at: 0, animated: true)
        segment.insertSegment(withTitle: "액세서리", at: 1, animated: true)
        segment.insertSegment(withTitle: "그 외", at: 2, animated: true)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    // 스크롤 뷰
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // 이미지 뷰
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.image = UIImage(named: "ot")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 이미지 컨텐츠 뷰
    lazy var imageViewContents: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.image = resizedImage1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 버튼 뷰
    lazy var productButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width:view.frame.width, height: 1000)
        button.addTarget(self, action: #selector(pressProduct), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func buildInterface() {
        buildAddView()
        buildAutoLayout()
    }
    
    
    func buildAddView() {
        view.addSubview(labelMain)
        view.addSubview(segment)
        view.addSubview(imageView)
        view.addSubview(scrollView)
        
        scrollView.addSubview(imageViewContents)
        scrollView.addSubview(productButton)
    }
    
    func buildAutoLayout() {
        
        // 메인 레이블 레이아웃
        NSLayoutConstraint.activate([
            labelMain.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            labelMain.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            labelMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelMain.heightAnchor.constraint(equalToConstant: 40)
        ])
    
        // 세그먼트 레이아웃
        NSLayoutConstraint.activate([
            segment.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            segment.topAnchor.constraint(equalTo: labelMain.bottomAnchor, constant: 4),
            segment.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
        
            segment.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // 이미지 뷰 레이아웃
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 4),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            imageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        // 스크롤 뷰 레이아웃
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
        
        // 이미지 콘텐츠 뷰 레이아웃
        NSLayoutConstraint.activate([
            imageViewContents.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            imageViewContents.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            imageViewContents.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            imageViewContents.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
        ])
    }
    
    @objc func segmentChanged(_ segemnt: UISegmentedControl) {
        switch segemnt.selectedSegmentIndex {
        case 0:
            imageView.image = UIImage(named: "ot")
            imageViewContents.image = resizedImage1
            
        case 1:
            imageView.image = UIImage(named: "ac")
            imageViewContents.image = resizedImage2
            
        case 2:
            imageView.image = UIImage(named: "yongpum")
            imageViewContents.image = resizedImage3
        default:
            imageView.image = UIImage(named: "ot")
            imageViewContents.image = resizedImage1
        }
    }
    
    @objc func pressProduct() {
        let nextViewController = DetailViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
