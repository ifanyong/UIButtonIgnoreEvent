# UIButtonIgnoreEvent
button避免多次连续点击造成多次执行事件

用的时候很easy，
首先导入头文件
#import "UIControl+FY.h"
然后是像其他的按钮一样，只是多了设置间隔事件的代码。
_button.acceptEventInterval = 2;
