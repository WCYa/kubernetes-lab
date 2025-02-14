# Quick Start

```shell
python3.11 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
pip3 install -r kubespray/requirements.txt

cd kubespray
ansible-playbook -i ../inventory/my-cluster/inventory.ini cluster.yml
```

## Issue notes

- [KubeSpray issue 11870](https://github.com/kubernetes-sigs/kubespray/issues/11870)
- `Unsupported parameters for (community.general.modprobe) module: persistent. Supported parameters include: name, params, state.` A similar issue as 11870.
