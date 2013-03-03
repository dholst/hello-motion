class TabsController < UITabBarController
  def initWithNibName(name, bundle: bundle)
    super

    self.viewControllers = [
      controller(ChickenController, "109-chicken", 1),
      controller(AlphapetController, "140-gradhat", 2),
      controller(Bada55Controller, "128-bone", 3)
    ]

    self
  end

  def controller(clazz, image, index)
    controller = clazz.alloc.initWithNibName(nil, bundle: nil)
    controller.tabBarItem = UITabBarItem.alloc.initWithTitle(clazz::TITLE, image: UIImage.imageNamed(image), tag: index)
    UINavigationController.alloc.initWithRootViewController(controller)
  end
end
