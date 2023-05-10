//
//  ViewController.swift
//  TestApp
//
//  Created by Дмитрий Лоренц on 04.05.2023.
//

import UIKit
import SnapKit

final class HomeController: UIViewController {
    
    //MARK: - Outlets,  constants and variables
    
    var collectionView: UICollectionView!
    var menuButton: UIButton = {
        let button  = UIButton(type: .system)
        let image = UIImage(named: "menuIcon")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont.montserrat(.bold, 20)
        let attributeFirst: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font : font]
        let attributeSecond = [NSAttributedString.Key.foregroundColor: UIColor.buttonColor, NSAttributedString.Key.font: font]
        
        let textFirst = NSMutableAttributedString(string: "Trade by ", attributes: attributeFirst)
        let textSecond = NSAttributedString(string: "bata", attributes: attributeSecond)
        textFirst.append(textSecond)
        label.attributedText = textFirst
        return label
    }()
    

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryBackground
        setupOutlets()
        setupConstraints()
    }
    //MARK: - Setup
    private func setupOutlets() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createCompositionalLayout() )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        collectionView.register(IconsCollectionViewCell.self, forCellWithReuseIdentifier: IconsCollectionViewCell.reuseID)
        collectionView.register(LatestCollectionViewCell.self, forCellWithReuseIdentifier: LatestCollectionViewCell.reuseID)
        collectionView.register(FlashSaleCollectionViewCell.self, forCellWithReuseIdentifier: FlashSaleCollectionViewCell.reuseID)
        collectionView.register(BrandsCollectionViewCell.self, forCellWithReuseIdentifier: BrandsCollectionViewCell.reuseID)
        
        view.addSubview(menuButton)
        view.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        
        menuButton.snp.makeConstraints { make in
            make.top.equalTo(53)
            make.leading.equalTo(15)
            make.height.equalTo(24)
            make.width.equalTo(22)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(100)
            make.top.equalToSuperview().inset(53)
        }
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(200)
        }
    }
//MARK: - Create functions
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionNumber, layoutEnviroment in
            switch sectionNumber {
            case SectionType.iconSection.rawValue:
                return self.createIconsSection()
            case SectionType.latestSection.rawValue:
                return self.createLatestSection()
            case SectionType.flashSale.rawValue:
                return self.createFlashSaleSection()
            case SectionType.brands.rawValue:
                return self.createBrandsSection()
            default: return nil
            }
        }
        return layout
        
    }
    private func createIconsSection() -> NSCollectionLayoutSection {
        
        //item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/6),
            heightDimension: .fractionalWidth(1/6) )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //group.interItemSpacing = NSCollectionLayoutSpacing.flexible(12)
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private func createLatestSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalWidth(1/3*149/114) )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
           
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private func createFlashSaleSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/2),
            heightDimension: .fractionalWidth(1/2*221/174))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
    
    private func createBrandsSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/4),
            heightDimension: .fractionalWidth(1/4))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        return section
    }

}

extension HomeController: UICollectionViewDelegate {
    
}

extension HomeController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        SectionType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case SectionType.iconSection.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IconsCollectionViewCell.reuseID, for: indexPath)
            return cell
        case SectionType.latestSection.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCollectionViewCell.reuseID, for: indexPath)
            return cell
        case SectionType.flashSale.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlashSaleCollectionViewCell.reuseID, for: indexPath)
               return cell
        case SectionType.brands.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandsCollectionViewCell.reuseID, for: indexPath)
               return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    
}
