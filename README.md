# devstack-gc
Scripts to install Devstack in Google Cloud  VM

In VM Console create the  Firewall rules

    Name: allownovnc
    Ingress
    Allow
    Targets: All Instances
    Source IP ranges: 0.0.0.0/0
    Protocols and Ports: tcp/6080

In Compute Engine Create a new VM

    Name: devstack
    Machine type: 2 vCPUs 7.5 GB memory at least
    Boot disk: Ubuntu 16.04, 30GB disk (Standard or SSD)
    Firewall: Allow HTTP and HTTPS traffic
	
Open SSH console and run screen to help you get back the session when SSH conection gets lost (reestablish ssh and run screen -r), clone this repo:

git clone https://github.com/balkanbgboy/devstack-gc



Run script to install Devstack with latest master:

sh devstack-gcp/devstack.sh

The script displays Horizon Dashboard URL in the very last line of the output.
