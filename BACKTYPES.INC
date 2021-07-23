Type
    DestinationRecord   = Record
                            Title           : pString;
                            DestType        : Integer;  { 0=disk, 1=file }
                            Device          : GSOSOutString;
                            FullPathName    : PathName;
                            FileName        : PathName;
                            DeviceDescr     : dinfoOSDCB;
                            FirstBlock      : Integer;
                            UsedBlocks      : Integer;
                            CurrentBlock    : Integer;
                            DeviceNum       : Integer;
                            DeviceType      : Integer;
                            MemberNum       : Integer;
                            Valid           : Boolean;
                          end;
  
    FileRecPtr          = ^FileRecord;

   {   *****  IMPORTANT  ***** FileRecord MUST NOT EXCEED 128 BYTES     }
 
    FileRecord          = Record
                            NextFile         : FileRecPtr;         {    4 }
                            DirEntry         : dirEntryOSDCB;      {   62 }
                            DataOffset       : LongInt;            {    4 }
                            ResourceOffset   : LongInt;            {    4 }
                            OptionListOffset : LongInt;            {    4 }
                            OptionListLength : Integer;            {    2 }
                            ParentDir        : FileRecPtr;         {    4 }
                            ThisDir          : FileRecPtr;         {    4 }
                            Selected         : Integer;            {    2 }
                            Created          : Boolean;            {    2 }
 
    { Insert any new fields BEFORE FileName !  The procedure WriteHeader }
    { assumes that the FileName field is the last in the record when     }
    { calculating the size in bytes of one record.                       }
 
                            FileName         : FilenameString;     {   36 }
                          end;                                     {------}
                                                                   {  128 }
 
    {   *****  IMPORTANT  ***** BackupHeaderType MUST NOT EXCEED 1024 BYTES  }
 
    BackupHeaderType    = Record
                            BackupDate          : LongInt;            {    4 }
                            BackupTime          : LongInt;            {    4 }
                            NumOfFiles          : Integer;            {    2 }
                            RootDirName         : GSOSInString;       {  512 }
                            FileList            : FileRecPtr;         {    4 }
                            BckMajorRelease     : Integer;            {    2 }
                            BckMinorRelease     : Integer;            {    2 }
                            FileSystem          : Integer;            {    2 }
                            BackupType          : Boolean;            {    2 }
                            Selected            : Integer;            {    2 }
                            SourceDeviceIcon    : longint;            {    4 }
                            DirectoryLength     : longint;            {    4 }
                            TotalDisks          : longint;            {    4 }
                            NumLeft             : Integer;            {    2 }
 
    { Insert any new fields before BackupLength !  The procedure WriteHeader }
    { assumes that the BackupLength field is the last in the record when     }
    { calculating the size in bytes of one record.                           }
 
                            BackupLength        : LongInt;            {    4 }
                          end;                                        {------}
                                                                      {  542 }
 
    WorkAreaTypePtr     = ^WorkAreaType;
    WorkAreaType        = Byte;
 
    { WorkAreaType should actually be:
                           packed array [LongZero..WorkBufferSize] of Char; }

    preferencesType     = record
                            overwriteOldFiles       :   Boolean;
                            overwritePrompt         :   Boolean;
                            overwriteAllFiles       :   Boolean;
                            compressOnRestore       :   Boolean;
                            verifyDisks             :   Boolean;
                            backupBitsToBeCleared   :   Boolean;
                            deletePartialBackup     :   Boolean;
                          end;

    preferencesPtr      = ^preferencesType;
    preferencesHandle   = ^preferencesPtr;

