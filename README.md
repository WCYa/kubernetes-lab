# Quick Start with Vagrant

This guide helps you quickly spin up a local kubernetes cluster using **Vagrant + Kubespray**.

---

## Environment

Tested on the following environment:

- **OS:** Ubuntu 24.04.3 LTS
- **Vagrant:** 2.4.9-1
- **libvirt-daemon:** 10.0.0-2ubuntu8.9
- **Python 3:** 3.12.3-1ubuntu0.8

Make sure you have Vagrant and libvirt installed before continuing.

---

## 1. Set up Python virtual environment

```shell
python3.12 -m venv venv
source venv/bin/activate
pip3 install -U -r kubespray/requirements.txt

cd kubespray
```

## 2. Modify network plugin in Vagrantfile (use Calico instead of Flannel), then start VMs.

```shell
sed -i 's/\$network_plugin ||= "flannel"/$network_plugin ||= "calico"/' Vagrantfile
vagrant up
```

## 3. Prepare inventory (copy sample + Vagrant-generated files)

```shell
cp -a inventory/sample inventory/my-cluster
cp ./.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory inventory/my-cluster/vagrant_ansible_inventory
cp -a ./.vagrant/provisioners/ansible/inventory/artifacts inventory/my-cluster/artifacts
```

## 4. Run Kubespray

Manually execute the Ansible playbook:

```shell
ansible-playbook -i inventory/my-cluster/vagrant_ansible_inventory cluster.yml
```

## 5. Use kubectl from the host

```shell
cd inventory/my-cluster/artifacts
./kubectl.sh get nodes
```

## Issue notes

- [KubeSpray issue 11870](https://github.com/kubernetes-sigs/kubespray/issues/11870)
- `Unsupported parameters for (community.general.modprobe) module: persistent. Supported parameters include: name, params, state.` A similar issue as 11870.
