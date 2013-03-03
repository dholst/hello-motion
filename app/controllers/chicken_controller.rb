class ChickenController < UIViewController
  TITLE = "Chicken"

  def viewDidLoad
    super

    self.title = "#{navigationController.viewControllers.count > 1 ? "MOAR " : ""}#{TITLE}"
    view.backgroundColor = UIColor.whiteColor

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = TITLE
    @label.sizeToFit
    view.addSubview(@label)

    rightButton = UIBarButtonItem.alloc.initWithTitle("MOAR", style: UIBarButtonItemStyleBordered, target: self, action: "push")
    navigationItem.rightBarButtonItem = rightButton
  end

  def push
    new_controller = ChickenController.alloc.initWithNibName(nil, bundle: nil)
    navigationController.pushViewController(new_controller, animated: true)
  end

  def viewWillAppear(animated)
    super
    @label.center = CGPointMake(x_center, y_center)
  end

  def x_center
    view.frame.size.width / 2
  end

  def y_center
    view.frame.size.height / 2
  end
end
