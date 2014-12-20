class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    autorelease_pool {
      MyRetainedView.alloc.init("foo")
      MyNotRetainedView.alloc.initWithFoo("foo")
    }

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UIViewController.alloc.init
    @window.makeKeyAndVisible

    true
  end
end

class MyRetainedView < UIView

  def init foo
    super()
  end

  def dealloc
    NSLog "dealloc MyRetainedView"
    super
  end

end

class MyNotRetainedView < UIView

  def initWithFoo foo
    init
  end

  def dealloc
    NSLog "dealloc MyNotRetainedView"
    super
  end

end