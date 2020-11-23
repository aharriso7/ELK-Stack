## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the yml file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting unauthorized access to the network.
- Load balancers protect availability of the server and prevent servers from becoming overloaded. The advantage of a jump box is only having one point of access to the virtual network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
- Filebeat watches for log files from the file system.
- Metricbeat records actual machine performance data.

The configuration details of each machine may be found below.


| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.7   | Linux (Ubuntu)   |
| Web-1    | Webserver| 10.0.0.8   | Linux (Ubuntu)   |
| Web-2    | Webserver| 10.0.0.9   | Linux (Ubuntu)   |
| ELK      | Log Mgt  | 10.1.0.4   | Linux (Ubuntu)   |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- My computer's public IP address

Machines within the network can only be accessed by SSH.
- Jump box provisioner 52.255.173.152

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | Local host public IP |
| Web-1    | Yes                 | Local host public IP |
| Web-2    | Yes                 | Local host public IP |
| ELK      | Yes                 | Local host public IP |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
-The main advantage of automating configuration with Ansible is it allows you to install software on multiple VM's and it allows you to easily manage multiple VM's.

The playbook implements the following tasks:
- Install docker.io
- Install python3 and python module
- Configure python module
- Download ELK image
- Configure ports and launch ELK container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.8 & Web-2 10.0.0.9

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects log events data.  It collects SSH login attempts, successes, and fails.  Metricbeat collects machine performance data.  It shows cloud provider, cloud region and RAM, among other things.  

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the file from the source to the destination.
- Update the config file to include group of servers and IP addresses.
- Run the playbook, and navigate to sudo docker ps to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? filebeat-playbook.yml Where do you copy it? Webserver group (Web-1 and Web-2)
- _Which file do you update to make Ansible run the playbook on a specific machine? filebeat-config.yml How do I specify which machine to install the ELK server on versus which to install Filebeat on? The machine's private IP address
- _Which URL do you navigate to in order to check that the ELK server is running? http://[elkserverIPaddress]:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc. 

curl https://upenn.bootcampcontent.com/upenn-bootcamp/upenn-eng-cyber-pt-08-2020-u-c/blob/master/1-Lesson-Plans/13-Elk-Stack-Project/2/Activities/01_Activity/Unsolved/Resources/filebeat-playbook.yml > /etc/ansible/roles/filebeat-playbook.yml

curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/files/filebeat-config.yml

ansible-playbook filebeat-config.yml
