class Bada55Controller < UIViewController
  TITLE = "BADA55"

  def viewDidLoad
    super
    self.title = TITLE
    view.backgroundColor = UIColor.bada55Color

    @points = [[0, 0], [50, 0], [0, 50], [50, 50]]
    @current_index = 0

    @view = UIView.alloc.initWithFrame [@points[@current_index], [100, 100]]
    @view.backgroundColor = UIColor.blackColor
    view.addSubview(@view)

    animate_to_next_point
  end


  def animate_to_next_point
    @current_index += 1
    @current_index = @current_index % @points.count

    UIView.animateWithDuration(0.3,
      delay: 1,
      options: UIViewAnimationOptionCurveLinear,

      animations: lambda {
         @view.frame = [@points[@current_index], [100, 100]]
      },

      completion: lambda {|finished|
        self.animate_to_next_point
      }
    )
  end
end
