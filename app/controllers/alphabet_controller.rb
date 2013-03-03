class AlphapetController < UIViewController
  TITLE = "A2Z"
  REUSE_IDENTIFIER = "CELL_IDENTIFIER"

  def viewDidLoad
    super
    self.title = TITLE
    @data = ("A".."Z").to_a
  end

  def viewWillAppear(animated)
    super
    view.addSubview(table = UITableView.alloc.initWithFrame(view.bounds))
    table.dataSource = self
    table.delegate = self
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(REUSE_IDENTIFIER) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: REUSE_IDENTIFIER)
    end

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell.textLabel.text = @data[indexPath.row]
    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.size
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    alert = UIAlertView.alloc.init
    alert.message = "#{@data[indexPath.row]} tapped!"
    alert.addButtonWithTitle "OK"
    alert.show
  end
end

