:
:: Build Windows binaries from Python script, and pack them in ZIP file
::
:: Johan van der Knijff, 10 December 2014
::
:: Dependencies:
:: 
:: - Python 2.7  (PyInstaller doesn't work with Python 3 yet!) 
:: - PyInstaller 2: http://www.pyinstaller.org/
:: - PyWin32 (needed by PyInstaller): http://sourceforge.net/projects/pywin32/files/
:: - a spec file
::
:: IMPORTANT: To build 32 bit binaries you need a 32 bit version of both Python and PyWin32! Can be installed
:: alongside a 64 install, so this shouldn't be a big deal.

::
@echo off
setlocal

::::::::: CONFIGURATION :::::::::: 

:: Path to 32 bit Python
set python=c:\python27_32bit\python

:: Path to PyInstaller
set pathPyInstaller=c:\pyinstall\

:: Script base name (i.e. script name minus .py extension)
set scriptBaseName=img2pdf

:: PyInstaller spec file that defines build options
set specFile=img2pdf.spec

:: Directory where build is created (should be identical to 'name' in 'coll' in spec file!!)
set distDir=.\dist\

::::::::: BUILD :::::::::::::::::: 

:: Build binaries
%python% %pathPyInstaller%\pyinstaller.py --debug %specFile%

:: Generate name for ZIP file
set zipName=%scriptBaseName%_win.zip

:: Create ZIP file
%python% .\zipdir.py %distDir%\%scriptBaseName% %distDir%\%zipName% 

::::::::: CLEANUP ::::::::::::::::: 

:: Delete build directory
rmdir build /S /Q

:: Delete directory in distdir
rmdir %distDir%\%scriptBaseName% /S /Q

::::::::: PARTY TIME! ::::::::::::::::: 

echo /
echo Done! Created %zipName% in directory %distDir%!
echo / 
