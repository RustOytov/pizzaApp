import UIKit

class NBController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menu = MenuVC()
        let contact = SecondVC()
        let profile = SecondVC()
        let basket = SecondVC()
        
        menu.tabBarItem = UITabBarItem(title: "Меню",
                                       image: UIImage.burger,
                                          tag: 0)
        contact.tabBarItem = UITabBarItem(title: "Контакты",
                                          image: UIImage.loc,
                                           tag: 1)
        profile.tabBarItem = UITabBarItem(title: "Профиль",
                                          image: UIImage.human,
                                           tag: 2)
        basket.tabBarItem = UITabBarItem(title: "Корзина",
                                         image: UIImage.basket,
                                           tag: 3)
        tabBar.tintColor = .red
        tabBar.backgroundColor = .white

        viewControllers = [menu, contact, profile, basket]
    }
}
