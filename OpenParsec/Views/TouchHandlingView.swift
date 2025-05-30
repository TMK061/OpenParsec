import ParsecSDK
import UIKit


class TouchController
{
	let viewController: UIViewController
	init(viewController: UIViewController) {
		self.viewController = viewController
	}
	
	func onTouch(typeOfTap:Int, location:CGPoint, state:UIGestureRecognizer.State)
	{
		let x = Int32(location.x)
		let y = Int32(location.y)

		// Send the mouse input to the host
		let parsecTap = ParsecMouseButton(rawValue:UInt32(typeOfTap))
		switch state
		{
			case .began:
				CParsec.sendMouseMessage(parsecTap, x, y, true)
			case .changed:
				CParsec.sendMousePosition(x, y)
			case .ended, .cancelled:
				CParsec.sendMouseMessage(parsecTap, x, y, false)
			default:
				break
		}
	}

	func onTap(typeOfTap:Int, location:CGPoint)
	{
		let parsecTap = ParsecMouseButton(rawValue:UInt32(typeOfTap))
		if SettingsHandler.cursorMode == .direct {
			let x = Int32(location.x)
			let y = Int32(location.y)

			// Send the mouse input to the host

			CParsec.sendMouseMessage(parsecTap, x, y, true)
			CParsec.sendMouseMessage(parsecTap, x, y, false)
		} else {
			CParsec.sendMouseClickMessage(parsecTap, true)
			CParsec.sendMouseClickMessage(parsecTap, false)
		}

	}

	public func viewDidLoad()
	{


		
	}



	
}
