@echo off
setlocal enableextensions enabledelayedexpansion
SET CORDOVA_ANDROID_VERSION=3.6.4


SET AND=%~dp0..\..\platforms\android\
If NOT "%CORDOVA_CMDLINE%"=="%CORDOVA_CMDLINE:--release=%" (
	SET mode=release
) else (
	SET mode=debug
)
SET FULL_PATH=%AND%..\..\..\..\CordovaLib\%CORDOVA_ANDROID_VERSION%.%mode%

IF "%CORDOVA_PLATFORMS%" == "android" (
	
	echo Cordova Android Version is: %CORDOVA_ANDROID_VERSION%	
	
	@rem echo PATH IS "%FULL_PATH%"
	if exist "%FULL_PATH%" (
		echo Version exists, %FULL_PATH%
		echo so remove %~dp0..\..\platforms\android\CordovaLib
		
		rmdir /S /Q "%and%CordovaLib"
		mklink /J "%and%CordovaLib" "%FULL_PATH%" 
		
		echo CordovaLib is already built in %mode%. Skipping.
		goto done
		
	) ELSE (
		SET original_path=%CD%
		
		echo Building xwalk_core_library in %mode% mode
		cd "%AND%CordovaLib\xwalk_core_library"
		call ant %mode%
		echo .
		echo Building CordovaLib in %mode% mode
		cd ..
		call ant %mode%
		cd ..
		echo %mode% > built.mode.txt
		CD "%original_path%"

		goto done
		
	)
)
:done
endlocal