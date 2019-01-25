~~~~~~~~ Welcome ~~~~~~~~~~~
This folder contains a wallaby_update.sh script which can be used to update the KIPR Robot Controller "Wallaby".   The script can be run by executing ./wallaby_update.sh from the same folder as this README.


~~~~~~~~ Terminology ~~~~~~~~~~~
* botui: the touchscreen robot interface
* harrogate: the web browser robot interface


~~~~~~~~ Update Log ~~~~~~~~~~~



Version 19 Fixes/Features:
* Python projects can be created in the Harrogate. It is still necessary to use the compile button.
* Camera support has been added to the python interface.

Version 19 Known Issues:
* Syntax highlighting is not switching to Python mode for python projects
* We have a good calibration for our batteries, but differences between boards in the sensing circuit will require further (per-board) calibration in order to have good battery capacity feedback.
* The battery level starts out at 100% when botui starts, and may take a minute to drop to the correct voltage.
​* The camera needs to be close to QR codes, and recognition may be shaky. This is due to our low resolution. A different camera at 320x240 worked better
The spin box in "Settings -> Camera View --> Show blob labels" is small and difficult to change
* The option to revert botui to non-fullscreen mode does not apply to the home screen
* If you use the "hide UI" button to access the terminal, there isn't an easy way to get back to botui



Version 18 Fixes/Features:
* Improvements were made to the reliability of shut down in.  We now should prevent any user motor/servo/create commands that could lead to disqualification after the shut_down_in process has initiated.
* bmd() was fixed, it now returns after the motor goal is reached
* libwallaby documentation has been posted on the homebase

Version 18 Known Issues:
* We have a good calibration for our batteries, but differences between boards in the sensing circuit will require further (per-board) calibration in order to have good battery capacity feedback.
* The battery level starts out at 100% when botui starts, and may take a minute to drop to the correct voltage.
​* The camera needs to be close to QR codes, and recognition may be shaky. This is due to our low resolution. A different camera at 320x240 worked better
The spin box in "Settings -> Camera View --> Show blob labels" is small and difficult to change
* The option to revert botui to non-fullscreen mode does not apply to the home screen
* If you use the "hide UI" button to access the terminal, there isn't an easy way to get back to botui



Version 17 Fixes/Features:
* A camera memory leak was fixed.  The camera can now be used for long periods of time.
* Bad camera frames no longer crash the user program or botui.
* The left button is now user-accessible via  left_button()
* New function right_button() which is more convenient and clearer than checking digital 13.
* The left and right buttons show up on the Sensor List widget.
* Virtual buttons have been implemented in botui. A,B,C are on by default.  The extra buttons  X,Y, and Z can be activated via extra_buttons_show()
* A DMA error has been fixed when stopping the program. In rare cases, it was previously necessary to restart the controller to fix servo/motor/sensor interaction after the DMA error.
* The WiFi signal in botui is now green once WiFi has started

Version 17 Known Issues:
* We have a good calibration for our batteries, but differences between boards in the sensing circuit will require further (per-board) calibration in order to have good battery capacity feedback.
* The battery level starts out at 100% when botui starts, and may take a minute to drop to the correct voltage.
​* The camera needs to be close to QR codes, and recognition may be shaky. This is due to our low resolution. A different camera at 320x240 worked better
The spin box in "Settings -> Camera View --> Show blob labels" is small and difficult to change
* The option to revert botui to non-fullscreen mode does not apply to the home screen
* If you use the "hide UI" button to access the terminal, there isn't an easy way to get back to botui


Version 16 Fixes/Features:
* Using the botui "Stop" button with the Create no longer causes Botui to crash
* The robot and Creates should now reliably stop with shut_down_in (important to avoid disqualification in tournaments)
* libwallaby documentation added, it will be made available on the homebase soon
* libwallaby python bindings in place, though they are not accessible via the Web IDE yet

Version 16 Known Issues:
* We have a good calibration for our batteries, but differences between boards in the sensing circuit will require further (per-board) calibration in order to have good battery capacity feedback.
* The battery level starts out at 100% when botui starts, and may take a minute to drop to the correct voltage.
​* The camera needs to be close to QR codes, and recognition may be shaky. This is due to our low resolution. A different camera at 320x240 worked better
The spin box in "Settings -> Camera View --> Show blob labels" is small and difficult to change
* The option to revert botui to non-fullscreen mode does not apply to the home screen
* If you use the "hide UI" button to access the terminal, there isn't an easy way to get back to botui


Version 15 Fixes/Features:
* botui launches much sooner
* botui will restart if it has crashed
* wallaby-estop has been removed (The ability to close programs with the "L" button)
* mrp() now works  (move relative position)
* The battery type setting is no longer set back to LiFePO4 when restarting the controller or botui.
* There is a confirmation dialog when switching battery types in botui
* The camera no longer outputs corrupt jpeg data warnings/errors to the user console.
* There is an audible low voltage alarm again, which can be configured under Settings->Battery in botui
* The servo page can now control multiple servos at once - servos are not disabled when switching between servo ports or closing the servo page.
* A bug which prevented updating via botui (Settings->Update) has been fixed
* Botui now displays any errors that occur during the update process (Settings->Update)
* console_clear() is now available 
* wait_for_light has been updated to use console_clear() and graphics


Version 15 Known Issues:
* [NEW] Using the botui "Stop" button to stop programs using the Create may sometimes cause botui to crash.  Botui should restart on it's own after a few seconds.
* We have a good calibration for our batteries, but differences between boards in the sensing circuit will require further (per-board) calibration in order to have good battery capacity feedback.
* The battery level starts out at 100% when botui starts, and may take a minute to drop to the correct voltage.
​* The camera needs to be close to QR codes, and recognition may be shaky. This is due to our low resolution. A different camera at 320x240 worked better
The spin box in "Settings -> Camera View --> Show blob labels" is small and difficult to change
* The option to revert botui to non-fullscreen mode does not apply to the home screen
* If you use the "hide UI" button to access the terminal, there isn't an easy way to get back to botui



Version 14 Fixes/Features:
* Better LiFePO4 battery capacity calibration
* In botui, the user can select a battery chemistry under settings, to adapt the battery capcity widget to LiFePO4, LiPo, or NiMH   (most users have LiFePO4 - the default)
* Enabled QR channels in libwallaby and botui
* Fixed polarity of get_servo_enabled
* Implemented blob confidence for HSV channels
* Camera viewer can now label blobs according to their blob number. The number of blobs to label is configurable through Settings -> Camera View. The default is 0. Since this is a new feature, I'm interested in any feedback.
* Bounding boxes in camera viewer can be toggled through Settings -> Camera View. The default is ON.


Version 14 Known Issues:
* [NEW] We have a good calibration for our batteries, but differences between boards in the sensing circuit will require further (per-board) calibration in order to have good battery capacity feedback.
* [NEW] The battery type setting is reset to LiFePO4 when restarting the controller or botui.
* [NEW] The battery level starts out at 100% when botui starts, and may take a minute to drop to the correct voltage.
​* [NEW] The camera needs to be close to QR codes, and recognition may be shaky. This is due to our low resolution. A different camera at 320x240 worked better
The spin box in "Settings -> Camera View --> Show blob labels" is small and difficult to change
* mrp() is not yet functional
* the option to revert botui to non-fullscreen mode does not apply to the home screen
* The camera outputs corrupt jpeg data warnings/errors to the user console.
* There is no audible low voltage alarm, only the on-screen battery capacity display and the yellow blinking LED warning.
* If you use the "hide UI" button to access the terminal, there isn't an easy way to get back to botui



Version 13 Fixes/Features:
* The version number has been increased to 13
* The battery capacity calculation has been improved for our kit (LiFePO4) batteries.
* The graphics_characters.h functions have been added through the #include "kipr/botball.h"
* The close button has been hidden on botui to prevent accidental clicks.
* botui now starts in fullscreen mode
* There is an option to revert the fullscreen change under Settings->GUI
* To get back to the terminal, if needed, press Settings->Hide UI 
* There is now a page in botui to allow for updating Wallaby versions via the touchscreen and USB drive
* Servos are now disabled as the servo widget is launched. They can then be controlled one at a time by using the goal dial and enable/disable button.
* WiFi access point name and passphrase are now shown on the botui "About" page


Version 13 Known Issues:
* The battery level starts out at 100% when botui starts, and may take a minute to drop to the correct voltage.
* mrp() is not yet functional
* the option to revert botui to non-fullscreen mode does not apply to the home screen
* The camera outputs corrupt jpeg data warnings/errors to the user console.
* There is no audible low voltage alarm, only the on-screen battery capacity display and the yellow blinking LED warning.
* If you use the "hide UI" button to access the terminal, there isn't an easy way to get back to botui

