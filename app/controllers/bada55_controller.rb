class Bada55Controller < UIViewController
  TITLE = "BADA55"

  def viewDidLoad
    super
    self.title = TITLE
    view.backgroundColor = UIColor.bada55Color
  end
end
