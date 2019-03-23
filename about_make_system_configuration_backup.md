# Essense section

These backuped data are very sensitive in security means sokeep them as secure as possible

The configuration backup is duinng in folder with name '+%Y-%m-%d_%H-%M_configuration_backup'

To execute this script you need to add to the script an execute permissions and lunch it by '/path/to/scriptname' or run it using a 'bash /path/to/scriptname' command.


# Some explenaions about script internals


## Section about _dpkg_get_selections.bkp file

Command:

# dpkg --get-selections > _dpkg_get_selections.bkp

Note:

Create a backup of what packages are currently installed:

dpkg --get-selections > _dpkg_get_selections.bkp
Then (on another system) restore installations from that list:

dpkg --clear-selections
sudo dpkg --set-selections < _dpkg_get_selections.bkp
To get rid of stale packages:

sudo apt-get autoremove
To get installed like at backup time (i.e. to install packages set by dpkg --set-selections):

sudo apt-get dselect-upgrade




## Section about /etc_copy directory

Command:

# rsync -av --delete /etc/ ./etc_copy/

Note:

1. -a = recursive (recurse into directories), links (copy symlinks as symlinks), perms (preserve permissions), times (preserve modification times), group (preserve group), owner (preserve owner), preserve device files, and preserve special files.

2. -v = verbose. The reason I think verbose is important is so you can see exactly what rsync is backing up. Think about this: What if your hard drive is going bad, and starts deleting files without your knowledge, then you run your rsync script and it pushes those changes to your backups, thereby deleting all instances of a file that you did not want to get rid of?

3. –delete = This tells rsync to delete any files that are in Directory2 that aren’t in Directory1. If you choose to use this option, I recommend also using the verbose options, for reasons mentioned above.
