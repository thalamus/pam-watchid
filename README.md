This is obsolete now - just use the Apple included pam_tid.so that is included with macOS:

Just add the following to /etc/pam.d/sudo:
auth       sufficient     pam_tid.so

