{$ keep 'obj/Backup'   }
{$ memorymodel 0   }
{$ Stacksize 16384 }
Program Backup(Input, Output, ErrorOutput);

Uses Common, QuickdrawII, ControlMgr, WindowMgr, GSOS, DialogMgr,
     SFToolSet, ListMgr, IntegerMath, LineEdit, ToolLocator, MenuMgr,
     DeskMgr, MemoryMgr, ResourceMgr;

{$ libprefix '13/ezlibdefs' }
USES EZConst, EZMisc, EZControls, EZWindows, EZLineEdit, EZDisk, EZDates,
     EZAlerts, EZString, EZTools, EZMenu, EZList, EZCrypt, EZDebug;

{$ LibPrefix 'intf/' }
Uses Backdata, Backinit, BackEvent;

begin
    StartUp;
 
    If Not UserAbort then begin
        EventLoop;
    end;
 
    If Not BadVersion then begin
        ShutDown;
    end;
end.
