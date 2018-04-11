[uwsgi]
socket = wsgi.sock
threads = 2
master = 1
module = mastercard.wsgi
;SETUP chdir to $REPO/web
chdir = /webapps/uctenky-dev/
chmod-socket=666
stats = /var/stats/%n.sock
