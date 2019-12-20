Before using this script you have to edit the 'DomainScript.ps1' and 'WorkgroupScript.ps1' files to
include your network credentials (and your account must have permission to add/remove computers
from the domain). This is the '$username' and '$password' lines. Because you have to hard-code your
username and password, it's probably not a good idea to share this script once you've set them.

After saving these changes, to run the scripts, just double click 'run.bat' from right in this folder,
you don't need to copy any files, the script will automatically copy everything it needs to the computer.

The script runs in 2 phases. It removes the computer from it's current domain and places it in a
workgroup named 'TEMP', then restarts and stops at the logon screen.
Once the computer is ready to be added into the new domain, just logon to the computer (you have to log on
to the same account you ran the script from though), after a couple seconds the second part of the script
will automatically run and move the comptuter into the new domain. After this it will delete itself from
the computer and restart the computer. After this, the computer should be good to go!
Between the first restart and the time you log back in, you must reconfigure the computer in ADCon and do
any OU reshuffling you have to. The computer assumes this is all done when you log back on.

The script temporarily copies 2 files to:
  - C:\Users\<YourAccount>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\runDomainScript.bat
  - C:\Users\<YourAccount>\Desktop\DomainScript.ps1
Both of these files are automatically removed before the 2nd restart occurs.

===== WARNING =====
Wait until the computer fully starts up before running this script. It copies files into the startup folder
so they'll be run when you reboot the computer, but if you run this script before the computer finishes
starting up, it may acidentally run the second part of the script prematurely, since it'll run stuff in
startup while it's still starting up.
