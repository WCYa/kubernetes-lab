# Quick Start

```shell
python3.11 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
pip3 install -r kubespray/requirements.txt

cd kubespray
ansible-playbook -i ../inventory/my-cluster/inventory.ini cluster.yml
```
