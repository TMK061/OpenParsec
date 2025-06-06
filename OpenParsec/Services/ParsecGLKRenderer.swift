import GLKit
import ParsecSDK

class ParsecGLKRenderer:NSObject, GLKViewDelegate, GLKViewControllerDelegate
{
	var glkView:GLKView
	var glkViewController:GLKViewController
	
	var lastWidth:CGFloat = 1.0

	var lastImg: CGImage?
	let updateImage: () -> Void
	
	init(_ view:GLKView, _ viewController:GLKViewController,_ updateImage: @escaping () -> Void)
	{
		self.updateImage = updateImage
		glkView = view
		glkViewController = viewController

		super.init()

		glkView.delegate = self
		glkViewController.delegate = self

	}

	deinit
	{
		glkView.delegate = nil
		glkViewController.delegate = nil
	}

	func glkView(_ view:GLKView, drawIn rect:CGRect)
	{
		let deltaWidth: CGFloat = view.frame.size.width - lastWidth
		if deltaWidth > 0.1 || deltaWidth < -0.1
		{
		    CParsec.setFrame(view.frame.size.width, view.frame.size.height, view.contentScaleFactor)
	        lastWidth = view.frame.size.width
		}
                let timeout: UInt32 = SettingsHandler.lowPowerMode ? 33 : 16
                CParsec.renderGLFrame(timeout: timeout)
		
		updateImage()
		

//		glFinish()
		//glFlush()
	}

	func glkViewControllerUpdate(_ controller:GLKViewController) { }
}
