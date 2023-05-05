//
//  ViewController.swift
//  TestApp
//
//  Created by Дмитрий Лоренц on 04.05.2023.
//

import UIKit
import SnapKit

final class HomeController: UIViewController {
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutlets()
        setupConstraints()
    }
    //MARK: - Setup
    private func setupOutlets() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createCompositionalLayout() )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .yellow
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
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
        let section = NSCollectionLayoutSection(group: <#T##NSCollectionLayoutGroup#>)
        return section
    }
    
    private func createLatestSection() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: <#T##NSCollectionLayoutGroup#>)
        return section
    }
    
    private func createFlashSaleSection() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: <#T##NSCollectionLayoutGroup#>)
        return section
    }
    
    private func createBrandsSection() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: <#T##NSCollectionLayoutGroup#>)
        return section
    }

}

extension HomeController: UICollectionViewDelegate {
    
}

extension HomeController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case SectionType.iconSection.rawValue:
            return IconsCollectionViewCell()
        case SectionType.latestSection.rawValue:
            return LatestCollectionViewCell()
        case SectionType.flashSale.rawValue:
            return FlashSaleCollectionViewCell()
        case SectionType.brands.rawValue:
            return BrandsCollectionViewCell()
        default:
            return UICollectionViewCell()
        }
    }
    
    
}
