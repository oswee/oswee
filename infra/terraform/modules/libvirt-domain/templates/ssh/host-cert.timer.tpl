[Unit]
Description=Sign a new host cert on boot, then daily
[Timer]
OnCalendar=daily
Persistent=true
Unit=sign-host-certificate.service
[Install]
WantedBy=timers.target
