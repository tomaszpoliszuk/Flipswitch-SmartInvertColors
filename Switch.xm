#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface SmartInvertColorsSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSInvertColorsEnabled();
extern "C" void _AXSInvertColorsSetEnabled(BOOL);

@implementation SmartInvertColorsSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSInvertColorsEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSInvertColorsSetEnabled(newState == FSSwitchStateOn);
}

@end
