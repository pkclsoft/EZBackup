# EZBackup - A backup tool for GS/OS on the Apple IIGS

EZBackup is a GS/OS application written in [ORCA/Pascal](https://github.com/byteworksinc/ORCA-Pascal) back in the early 90's.

This application may be used to backup your GS/OS volume to multiple floppy disks, and later restore from those floppies.

Why bother keeping the application working and making the code available?

Well, as it happens, I still have a big box of 3.5" floppies containing the backups I last did of my Apple IIGS, and some of those backups were created using this application.  It was great to be able to use EZBackup to restore those 25+ year old floppies to a new volume and re-create my old development environment.

Whilst I've no evidence that anyone else ever used EZBackup (no-one ever sent me a shareware fee), maybe there are others out there that would like to restore their old backups.

Also, it's fun to have brought the application back to life, see how badly I wrote code all those years ago, and fix a few things in the process.

EZBackup depends on a library of code I wrote at the time called EZLib, now available as [EZLib_GS](https://github.com/pkclsoft/EZLib_GS) on Github.

As with EZLib, for EZBackup, the "EZ" comes from the name of the company I operated under at the time, EZ-Soft.

It was originally developed with an older version of ORCA Pascal, however this code now compiles and seems to work with ORCA Pascal 2.0 as provided on the OPUS II collection available via: [OPUS II at Juiced.GS](https://juiced.gs/vendor/byteworks/)

## Line Endings
The text and source files in this repository originally used CR line endings, as usual for Apple II text files, but they have been converted to use LF line endings because that is the format expected by Git. If you wish to move them to a real or emulated Apple II and build them there, you will need to convert them back to CR line endings.

If you wish, you can configure Git to perform line ending conversions as files are checked in and out of the Git repository. With this configuration, the files in your local working copy will contain CR line endings suitable for use on an Apple II. To set this up, perform the following steps in your local copy of the Git repository (these should be done when your working copy has no uncommitted changes):

1. Add the following lines at the end of the `.git/config` file:
```
[filter "crtext"]
	clean = LC_CTYPE=C tr \\\\r \\\\n
	smudge = LC_CTYPE=C tr \\\\n \\\\r
```

2. Add the following line to the `.git/info/attributes` file, creating it if necessary:
```
* filter=crtext
```

3. Run the following commands to convert the existing files in your working copy:
```
rm .git/index
git checkout HEAD -- .
```

Alternatively, you can keep the LF line endings in your working copy of the Git repository, but convert them when you copy the files to an Apple II. There are various tools to do this.  One option is `udl`, which is [available][udl] both as a IIGS shell utility and as C code that can be built and used on modern systems.

Another option, if you are using the [GSPlus emulator](https://apple2.gs/plus/) is to host your local repository in a directory that is visible on both your host computer, and the emulator via the excellent [Host FST](https://github.com/ksherlock/host-fst).

[udl]: http://ftp.gno.org/pub/apple2/gs.specific/gno/file.convert/udl.114.shk

## File Types
In addition to converting the line endings, you will also have to set the files to the appropriate file types before building on a IIGS.

So, once you have the files from the repository on your IIGS (or emulator), within the ORCA/M shell, execute the following commands:

    filetype makefile src
    filetype clean src 6

## Dependencies
### [EZLib_GS](https://github.com/pkclsoft/EZLib_GS)
As mentioned above, EZBackup depends on EZLib.  You must first build EZLib and run the "updatelib" script to copy the built library and its associated interfaces to the 13/ prefix under ORCA (where ORCA stores libraries).

### ORCA/Pascal Tool.Interface
Both EZBackup and EZLib, being ORCA/Pascal bodies of code, depend of course on the Tool.Interface provided with ORCA/Pascal.

Before you try to build and use EZLib and consequently, EZBackup, it is recommended that you take the latest Tool.Interface code from GitHub, and rebuild it using the supplied "Build" script.

## Building
To build EZBackup, you will need the ORCA/M environment present, and you will need the "MK" tool, also available [here on GitHub](https://github.com/pkclsoft/MK).

With the EZBackup repo downloaded and in place, and the MK tool built and installed, building the library is as simple as:

    mk

If all goes well, EZBackup will be built and created as "ez.backup".

## Documentation
### Manual
Refer to the Documentation folder, within which I've provided the original GS/OS Icon file for EZBackup, an Appleworks GS document containing the original manual, and text and markdown versions of that same document.
### Labels
There is also another Appleworks GS document that can be used to print 3.5" disk labels for EZBackup.

