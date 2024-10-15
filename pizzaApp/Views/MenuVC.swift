import UIKit

class MenuVC: UIViewController {
    
    var selectedIndex: IndexPath?
    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        let layout = createLayout()
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.register(ActionCell.self, forCellWithReuseIdentifier: "ActionCell")
        collectionView.register(TypeCell.self, forCellWithReuseIdentifier: "TypeCell")
        collectionView.register(PizzaCell.self, forCellWithReuseIdentifier: "PizzaCell")
        collectionView.dataSource = self
    }
}

//MARK: - createLayout
func createLayout() -> UICollectionViewCompositionalLayout {
    // section_1
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    section.contentInsets = NSDirectionalEdgeInsets(top: 104, leading: 0, bottom: 50, trailing: 0)

    // section_2
    let itemSizeTwo = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1.0))
    let itemTwo = NSCollectionLayoutItem(layoutSize: itemSizeTwo)

    let groupSizeTwo = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
    let groupTwo = NSCollectionLayoutGroup.horizontal(layoutSize: groupSizeTwo, subitems: [itemTwo])

    let sectionTwo = NSCollectionLayoutSection(group: groupTwo)
    sectionTwo.orthogonalScrollingBehavior = .continuous
    sectionTwo.interGroupSpacing = 2
    sectionTwo.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)

    // section_3
    let itemSizeThree = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
    let itemThree = NSCollectionLayoutItem(layoutSize: itemSizeThree)
    
    let groupSizeThree = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
    let groupThree = NSCollectionLayoutGroup.vertical(layoutSize: groupSizeThree, subitems: [itemThree])
    
    let sectionThree = NSCollectionLayoutSection(group: groupThree)
    sectionThree.interGroupSpacing = 50
    sectionThree.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 60, trailing: 8)


    
    return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
        switch sectionIndex {
        case 0:
            return section
        case 1:
            return sectionTwo
        case 2:
            return sectionThree
        default:
            return sectionThree
        }
    }
}
//MARK: - extesion
extension MenuVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 5
        case 2:
            return 4
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActionCell", for: indexPath) as! ActionCell
            if indexPath.row == 0 {
                cell.imageAction.image = .banerOne
            }else {
                cell.imageAction.image = .baner
            }
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeCell", for: indexPath) as! TypeCell
            switch indexPath.row {
            case 0:
                cell.customButton.setTitle("Пицца", for: .normal)
            case 1:
                cell.customButton.setTitle("Комбо", for: .normal)
            case 2:
                cell.customButton.setTitle("Десерты", for: .normal)
            case 3:
                cell.customButton.setTitle("Напитки", for: .normal)
            case 4:
                cell.customButton.setTitle("Добавки", for: .normal)
            default:
                break
            }
            if selectedIndex == indexPath {
                cell.customButton.backgroundColor = .pinkButton
                cell.customButton.setTitleColor(.systemPink, for: .normal)
                cell.customButton.layer.borderWidth = 0
            } else {
                cell.customButton.backgroundColor = .white
                cell.customButton.setTitleColor(.pinkButton, for: .normal)
                cell.customButton.layer.borderWidth = 2
            }
            cell.buttonAction = { [weak self] in
                self?.selectedIndex = indexPath
                self?.collectionView.reloadData()
            }
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PizzaCell", for: indexPath) as! PizzaCell
            switch indexPath.row {
            case 0:
                cell.imagePizza.image = .pizza1
                cell.namePizza.text = "Пицца четыре сыра"
                cell.secondText.text = "Соус Карбонара, Сыр \nМоцарелла, Сыр Пармезан, \nСыр Роккфорти, Сыр Чеддер \n(тёртый)"
                return cell
            case 1:
                cell.imagePizza.image = .pizza2
                cell.namePizza.text = "Ветчина и грибы"
                cell.secondText.text = "Ветчина,шампиньоны, \nувеличинная порция моцареллы, \nтоматный соус"
                return cell
            case 2:
                cell.imagePizza.image = .pizza3
                cell.namePizza.text = "Нежный лосось"
                cell.secondText.text = "Лосось, томаты черри, \nмоцарелла, соус песто"
                return cell
            case 3:
                cell.imagePizza.image = .pizza4
                cell.namePizza.text = "Баварские колбаски"
                cell.secondText.text = "Баварски колбаски,ветчина, \nпикантная пепперони, \nострая чоризо, моцарелла, \nтоматный соус"
                return cell
            default:
                return cell
            }
        default:
            fatalError("Unexpected section index: \(indexPath.section)")
        }
    }
}

