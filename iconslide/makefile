ARCHS = arm64 armv7
TARGET = iphone:clang:11.2:9.0
DEBUG = 0
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = IconSlide
IconSlide_FILES = ICSRootListController.m
IconSlide_INSTALL_PATH = /Library/PreferenceBundles
IconSlide_FRAMEWORKS = UIKit Foundation 
IconSlide_PRIVATE_FRAMEWORKS = Preferences
IconSlide_EXTRA_FRAMEWORKS += CepheiPrefs
IconSlide_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/IconSlide.plist$(ECHO_END)
