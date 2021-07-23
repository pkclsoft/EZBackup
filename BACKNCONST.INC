    AppleMenu           = 0;
    AppleAbout          = 257;
 
    FileMenu            = 1;
    BackUp              = 301;
    Restore             = 303;
    Catalog             = 304;
    FilePreferences     = 306;
    FileQuit            = 308;
 
    EditMenu            = 2;
    EditUndo            = 250;
    EditCut             = 251;
    EditCopy            = 252;
    EditPaste           = 253;
    EditClear           = 254;
 
    SpecialMenu         = 5;
    SpecialBadBlockChk  = 601;
    SpecialFormatErase  = 602;
    SpecialOptimize     = 603;

    popUpMenuNumber     = 800;
 
    LongZero            = $00000000;
 
    ConfigPrefixLength  = 15;
 
    ConfigPrefixNumber  = 0;
 
    BackupPrefixNumber  = 9;
 
    plainMask           = $0000;
 
    BlockByteCount      = $00000200;  { The size of one disk block in bytes. }
 
    FileRecordLength    = 128;  { The number of bytes used per file when    }
                                { recording the file information in the     }
                                { saveset.                                  }
 
    MajorRelease        = 1;    { The release number of the program.        }
    MinorRelease        = 0;
 
    notSelected         = 0;
    included            = 1;
    excluded            = 0;
    markedOnly          = 2;

    backupMode          = 0;
    restoreMode         = 1;
    viewMode            = 2;
