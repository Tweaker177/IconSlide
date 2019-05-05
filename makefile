ARCHS = arm64 armv7
TARGET = iphone:clang:11.2:9.0
DEBUG = 0
#CFLAGS = -fobjc-arc
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = IconSlide
IconSlide_FILES = Tweak.xm
IconSlide_FRAMEWORKS = UIKit Foundation
IconSlide_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += iconslide
include $(THEOS_MAKE_PATH)/aggregate.mk
