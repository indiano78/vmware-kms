# vmware-kms

vmware-kms, is based on excellent [PyKMIP](https://github.com/OpenKMIP/PyKMIP) Project, and inspired from [lamw/vmwkmip](https://hub.docker.com/r/lamw/vmwkmip) docker image.
the principal difference, is on persistent storage, and availability to backup keys.

it must be not used on production environments, due to lack of security, but ideal for labs or pre-prod infrastructures.

how to use it :

> docker run -d --name vmware-kms -p 5696:5696 -v "localpath":/pykmip indiano78/vmware-kms:latest

on firts run, program will generate configuration files, self-signed certificates, and database stored on your "localpath".

server logs are located on contener at path bellow:
> /var/log/pykmip/server.log

Happy docker kms.